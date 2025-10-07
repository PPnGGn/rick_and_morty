import 'package:rick_and_morty/domain/entities/entities.dart';

abstract class CharacterRepository {
  // Основные методы с поддержкой кеширования
  Future<List<CharacterEntity>> getCharacters({
    int page = 1,
    String? name,
    String? status,
  });

  Future<CharacterEntity?> getCharacter(int id);

  // Принудительное обновление данных
  Future<List<CharacterEntity>> refreshCharacters();

  // Утилиты кеша
  Future<void> clearCache();
  Future<bool> hasCachedData({int? page, int pageSize = 20});

  // Избранное из локалки
  Future<void> addToFavorites(CharacterEntity character);
  Future<void> removeFromFavorites(int id);
  Future<List<CharacterEntity>> getFavorites();
  Future<bool> isFavorite(int id);
  Future<Set<int>> getFavoriteIds();
}
