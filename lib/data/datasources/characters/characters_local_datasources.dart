import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/database/database.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:drift/drift.dart';
import 'package:rick_and_morty/domain/enums/enums.dart';

@lazySingleton
class CharacterLocalDataSource {
  final AppDatabase _database;

  CharacterLocalDataSource(this._database);

  /// Кеширование персонажей из API (isFavorite всегда false!)
  Future<void> cacheCharacters(List<CharacterEntity> characters) async {
    debugPrint(
      'Начало кеширования персонажей, количество: ${characters.length}',
    );
    await _database.transaction(() async {
      for (final character in characters) {
        debugPrint(
          'Пишем персонажа в БД: ${character.name} (id: ${character.id})',
        );
        final existing = await (_database.select(
          _database.characters,
        )..where((tbl) => tbl.id.equals(character.id))).getSingleOrNull();

        if (existing != null) {
          // Уже есть — обновляем, сохраняем статус избранного
          debugPrint(
            'Обновляем персонажа: ${character.name} (id: ${character.id})',
          );
          await (_database.update(
            _database.characters,
          )..where((tbl) => tbl.id.equals(character.id))).write(
            CharactersCompanion(
              name: Value(character.name),
              status: Value(character.status.value),
              species: Value(character.species),
              type: Value(character.type),
              gender: Value(character.gender.value),
              originName: Value(character.origin?.name),
              originUrl: Value(character.origin?.url),
              locationName: Value(character.location?.name),
              locationUrl: Value(character.location?.url),
              image: Value(character.image),
              episode: Value(character.episode.join(',')),
              url: Value(character.url),
              cachedAt: Value(DateTime.now()),
              // НЕ трогаем isFavorite, оставляем как было!
            ),
          );
        } else {
          // Нет такого персонажа — добавляем как нового, НЕ избранного
          debugPrint(
            'Добавляем нового персонажа: ${character.name} (id: ${character.id})',
          );
          await _database
              .into(_database.characters)
              .insert(
                CharactersCompanion(
                  id: Value(character.id),
                  name: Value(character.name),
                  status: Value(character.status.value),
                  species: Value(character.species),
                  type: Value(character.type),
                  gender: Value(character.gender.value),
                  originName: Value(character.origin?.name),
                  originUrl: Value(character.origin?.url),
                  locationName: Value(character.location?.name),
                  locationUrl: Value(character.location?.url),
                  image: Value(character.image),
                  episode: Value(character.episode.join(',')),
                  url: Value(character.url),
                  cachedAt: Value(DateTime.now()),
                  isFavorite: const Value(false), // Важно!
                ),
              );
        }
      }
    });
    debugPrint('Завершено кеширование персонажей!');
  }

  /// Получить всех персонажей из кеша
  Future<List<CharacterEntity>> getCachedCharacters() async {
    debugPrint('Достаем персонажей из кеша...');
    final rows = await _database.select(_database.characters).get();
    debugPrint('Найдено в кеше персонажей: ${rows.length}');
    if (rows.isNotEmpty) {
      debugPrint('Первый персонаж из кеша: ${rows.first.name}');
    }
    return rows.map((row) => _mapToEntity(row)).toList();
  }

  /// Получить персонажа из кеша по id
  Future<CharacterEntity?> getCachedCharacter(int id) async {
    final result = await (_database.select(
      _database.characters,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    return result != null ? _mapToEntity(result) : null;
  }

  /// Очистить кеш (оставить только избранных)
  Future<void> clearCache() async {
    await (_database.delete(
      _database.characters,
    )..where((tbl) => tbl.isFavorite.equals(false))).go();
  }

  /// Проверить, есть ли кеш
  Future<bool> hasCachedData() async {
    final count = await (_database.selectOnly(
      _database.characters,
    )..addColumns([_database.characters.id.count()])).getSingle();
    return count.read(_database.characters.id.count()) != 0;
  }

  // ==== ИЗБРАННОЕ ====

  /// Добавить в избранное
  Future<void> addToFavorites(CharacterEntity character) async {
    await _database
        .into(_database.characters)
        .insertOnConflictUpdate(
          CharactersCompanion(
            id: Value(character.id),
            name: Value(character.name),
            status: Value(character.status.value),
            species: Value(character.species),
            type: Value(character.type),
            gender: Value(character.gender.value),
            originName: Value(character.origin?.name),
            originUrl: Value(character.origin?.url),
            locationName: Value(character.location?.name),
            locationUrl: Value(character.location?.url),
            image: Value(character.image),
            episode: Value(character.episode.join(',')),
            url: Value(character.url),
            cachedAt: Value(DateTime.now()),
            isFavorite: const Value(true),
          ),
        );
  }

  /// Удалить из избранного (сбросить флаг, но не удалять из кеша)
  Future<void> removeFromFavorites(int id) async {
    await (_database.update(_database.characters)
          ..where((tbl) => tbl.id.equals(id)))
        .write(const CharactersCompanion(isFavorite: Value(false)));
  }

  /// Получить только избранных
  Future<List<CharacterEntity>> getFavorites() async {
    final rows = await (_database.select(
      _database.characters,
    )..where((tbl) => tbl.isFavorite.equals(true))).get();
    return rows.map((row) => _mapToEntity(row)).toList();
  }

  /// Проверить, избранный ли персонаж (исправлено!)
  Future<bool> isFavorite(int id) async {
    final result =
        await (_database.select(_database.characters)
              ..where((tbl) => tbl.id.equals(id) & tbl.isFavorite.equals(true)))
            .getSingleOrNull();
    return result != null;
  }

  /// Маппер
  CharacterEntity _mapToEntity(Character dbCharacter) {
    return CharacterEntity(
      id: dbCharacter.id,
      name: dbCharacter.name,
      status: CharacterStatus.values.firstWhere(
        (e) => e.value == dbCharacter.status,
        orElse: () => CharacterStatus.unknown,
      ),
      species: dbCharacter.species ?? '',
      type: dbCharacter.type ?? '',
      gender: CharacterGender.values.firstWhere(
        (e) => e.value == dbCharacter.gender,
        orElse: () => CharacterGender.unknown,
      ),
      origin: dbCharacter.originName != null
          ? OriginEntity(
              name: dbCharacter.originName!,
              url: dbCharacter.originUrl ?? '',
            )
          : null,
      location: dbCharacter.locationName != null
          ? LocationEntity(
              name: dbCharacter.locationName!,
              url: dbCharacter.locationUrl ?? '',
            )
          : null,
      image: dbCharacter.image,
      episode: dbCharacter.episode?.split(',') ?? [],
      url: dbCharacter.url ?? '',
    );
  }
}
