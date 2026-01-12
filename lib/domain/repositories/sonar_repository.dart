import 'package:rick_and_morty/domain/entities/entities.dart';

abstract class SonarRepository {
  // Стрим описания персонажа
  // Сначала проверяет кэш, если нет — запрашивает API
  Stream<String> getCharacterDescription(CharacterEntity character);

  // Очистить кэш для не избранных персонажей
  Future<void> clearNonFavoriteCache();
}
