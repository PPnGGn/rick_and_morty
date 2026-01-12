import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SonarRemoteDatasource {
  final Dio _dio;
  final String _apiKey;

  static const String _baseUrl = 'https://api.perplexity.ai';

  SonarRemoteDatasource({required Dio dio, required String apiKey})
    : _dio = dio,
      _apiKey = apiKey;

  Stream<String> streamCharacterDescription(String characterName) async* {
    try {
      final requestBody = {
        'model': 'sonar-pro',
        'messages': [
          {
            'role': 'user',
            'content':
                'Сделай подробное описание "$characterName" из сериала рик и морти.',
          },
        ],
        'stream': true,
        'return_images': false,
        'temperature': 0.7,
      };

      final response = await _dio.post(
        '$_baseUrl/chat/completions',
        data: requestBody,
        options: Options(
          responseType: ResponseType.stream,
          headers: {
            'Authorization': 'Bearer $_apiKey',
            'Content-Type': 'application/json',
            'Accept': 'text/event-stream',
          },
          receiveTimeout: Duration(minutes: 5),
        ),
      );

      final stream = response.data.stream as Stream<Uint8List>;

      // Буфер для неполных строк
      String buffer = '';

      await for (final bytes in stream) {
        // Декодируем с allowMalformed для защиты от битых символов
        final text = utf8.decode(bytes, allowMalformed: true);

        // Добавляем к буферу
        buffer += text;

        // Разбиваем по строкам
        final lines = buffer.split('\n');

        // Последняя строка может быть неполной — оставляем в буфере
        buffer = lines.last;

        // Обрабатываем все полные строки
        for (int i = 0; i < lines.length - 1; i++) {
          final line = lines[i];

          if (line.startsWith('data: ')) {
            final data = line.substring(6);

            if (data.trim() == '[DONE]') continue;

            final content = _parseChunk(data);
            if (content.isNotEmpty) {
              yield content;
            }
          }
        }
      }

      // Обработать остаток буфера после завершения стрима
      if (buffer.isNotEmpty && buffer.startsWith('data: ')) {
        final data = buffer.substring(6);
        if (data.trim() != '[DONE]') {
          final content = _parseChunk(data);
          if (content.isNotEmpty) {
            yield content;
          }
        }
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        yield* Stream.error('Превышено время ожидания');
      } else if (e.type == DioExceptionType.badResponse) {
        yield* Stream.error('Ошибка сервера: ${e.response?.statusCode}');
      } else {
        yield* Stream.error('Ошибка сети: ${e.message}');
      }
    } catch (e) {
      yield* Stream.error('Неизвестная ошибка: $e');
    }
  }

  /// Парсит JSON chunk и извлекает текстовое содержимое
  ///
  /// Структура ответа:
  /// {
  ///   "choices": [
  ///     {
  ///       "delta": {
  ///         "content": "текст"
  ///       }
  ///     }
  ///   ]
  /// }
  String _parseChunk(String jsonStr) {
    try {
      final json = jsonDecode(jsonStr) as Map<String, dynamic>;

      // Извлекаем массив choices
      final choices = json['choices'] as List?;
      if (choices == null || choices.isEmpty) return '';

      // Берём первый choice (всегда один элемент в streaming)
      final firstChoice = choices[0] as Map<String, dynamic>;

      // Извлекаем delta объект
      final delta = firstChoice['delta'] as Map<String, dynamic>?;
      if (delta == null) return '';

      // Извлекаем content (может быть null в первом/последнем chunk)
      final content = delta['content'] as String?;
      return content ?? '';
    } catch (e) {
      // Если не смогли распарсить — пропускаем chunk
      return '';
    }
  }
}
