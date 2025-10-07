import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.network([
    @Default('Ошибка сети. Проверьте подключение к интернету') String message,
  ]) = NetworkFailure;

  const factory Failure.server([
    @Default('Ошибка сервера. Попробуйте позже') String message,
  ]) = ServerFailure;

  const factory Failure.cache([
    @Default('Ошибка локального хранилища') String message,
  ]) = CacheFailure;

  const factory Failure.validation([
    @Default('Некорректные данные') String message,
  ]) = ValidationFailure;

  const factory Failure.notFound([
    @Default('Данные не найдены') String message,
  ]) = NotFoundFailure;

  const factory Failure.unknown([
    @Default('Неизвестная ошибка') String message,
  ]) = UnknownFailure;
}
