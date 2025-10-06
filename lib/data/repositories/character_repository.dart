import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/data/datasources/characters/characters_local_datasources.dart';
import 'package:rick_and_morty/data/datasources/characters/characters_remote_datasource.dart';
import 'package:rick_and_morty/data/models/response/response_models.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/domain/repositories/character_repository.dart';

@LazySingleton(as: CharacterRepository)
class CharacterRepositoryImpl implements CharacterRepository {
  final CharactersRemoteDatasource _remote;
  final CharacterLocalDataSource _local;

  CharacterRepositoryImpl(this._remote, this._local);

  @override
  Future<List<CharacterEntity>> getCharacters({
    int page = 1,
    String? name,
    String? status,
  }) async {
    try {
      debugPrint('🌐 Пытаемся загрузить из сети...');
      final response = await _remote.getAllCharacters(
        page: page,
        name: name,
        status: status,
      );
      final characters = response.results
          .map((model) => model.toEntity())
          .toList();
      debugPrint('🌐 Загружено из сети: ${characters.length} персонажей');

      // Кешируем только первую страницу без фильтров
      if (page == 1 && name == null && status == null) {
        debugPrint('💾 Кешируем данные...');
        await _local.cacheCharacters(characters);
      }
      return characters;
    } catch (e) {
      debugPrint('❌ Ошибка загрузки из сети: $e');
      debugPrint('📱 Пробуем загрузить из кеша...');
      final cached = await _local.getCachedCharacters();
      if (cached.isEmpty) {
        debugPrint('❌ Кеш пуст!');
        throw Exception('Нет интернета и кеш пуст');
      }
      debugPrint('✅ Загружено из кеша: ${cached.length} персонажей');
      return cached;
    }
  }

  @override
  Future<CharacterEntity?> getCharacter(int id) async {
    try {
      final model = await _remote.getCharacterById(id);
      final entity = model.toEntity();
      await _local.cacheCharacters([entity]);
      return entity;
    } catch (e) {
      debugPrint('Ошибка сети! Загружаем персонажа из кеша: $e');
      return await _local.getCachedCharacter(id);
    }
  }

  @override
  Future<void> addToFavorites(CharacterEntity character) =>
      _local.addToFavorites(character);

  @override
  Future<void> removeFromFavorites(int id) => _local.removeFromFavorites(id);

  @override
  Future<List<CharacterEntity>> getFavorites() => _local.getFavorites();

  @override
  Future<bool> isFavorite(int id) => _local.isFavorite(id);

  @override
  Future<void> clearCache() => _local.clearCache();

  @override
  Future<bool> hasCachedData() => _local.hasCachedData();

  @override
  Future<List<CharacterEntity>> refreshCharacters() async {
    try {
      final response = await _remote.getAllCharacters(page: 1);
      final characters = response.results.map((c) => c.toEntity()).toList();
      await _local.cacheCharacters(characters);
      return characters;
    } catch (e) {
      throw Exception('Не удалось обновить персонажей: $e');
    }
  }
}
