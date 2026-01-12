import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/database/daos/character_description_dao.dart';
import 'package:rick_and_morty/core/database/database.dart';
import 'package:rick_and_morty/data/datasources/sonar/sonar_remote_datasource.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/domain/repositories/sonar_repository.dart';

@LazySingleton(as: SonarRepository)
class SonarRepositoryImpl implements SonarRepository {
  final SonarRemoteDatasource _remoteDatasource;
  final CharacterDescriptionDao _dao;

  SonarRepositoryImpl({
    required SonarRemoteDatasource remoteDatasource,
    required CharacterDescriptionDao dao,
  }) : _remoteDatasource = remoteDatasource,
       _dao = dao;

  @override
  Stream<String> getCharacterDescription(CharacterEntity character) async* {
    // 1. Проверяем кэш в БД
    final cached = await _dao.getDescriptionById(character.id);

    if (cached != null) {
      yield cached.description;
      return;
    }

    // 2. Если кэша нет — стримим с API

    String fullText = '';

    try {
      await for (final chunk in _remoteDatasource.streamCharacterDescription(
        character.name,
      )) {
        fullText += chunk;
        yield chunk;
      }

      // 3. Сохраняем в БД после завершения стриминга
      if (fullText.isNotEmpty) {
        await _dao.insertDescription(
          CharacterDescriptionsCompanion.insert(
            characterId: Value(character.id), // ← Обернули в Value()
            description: fullText,
            createdAt: DateTime.now(),
            // isFavorite не берём из character, он хранится отдельно
            isFavorite: const Value(false), // По умолчанию false
          ),
        );
      }
    } catch (e) {
      yield* Stream.error(e);
    }
  }

  @override
  Future<void> clearNonFavoriteCache() async {
    await _dao.deleteNonFavorite();
  }

  // Дополнительный метод: обновить статус избранного
  Future<void> updateFavoriteStatus(int characterId, bool isFavorite) async {
    await _dao.updateFavoriteStatus(characterId, isFavorite);
  }
}
