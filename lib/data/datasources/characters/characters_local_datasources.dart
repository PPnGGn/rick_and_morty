import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/database/database.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:drift/drift.dart';
import 'package:rick_and_morty/domain/enums/enums.dart';

@lazySingleton
class CharacterLocalDataSource {
  final AppDatabase _database;

  CharacterLocalDataSource(this._database);

  // Добавить персонажа в избранное
  Future<void> addToFavorites(CharacterEntity character) async {
    await _database.into(_database.characters).insertOnConflictUpdate(
      CharactersCompanion(
        id: Value(character.id),
        name: Value(character.name),
        status: Value(character.status.value), // Конвертируем enum в строку
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
        isFavorite: const Value(true),
      ),
    );
  }

  // Удалить из избранного
  Future<void> removeFromFavorites(int id) async {
    await (_database.delete(_database.characters)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  // Получить все из избранного
  Future<List<CharacterEntity>> getFavorites() async {
    final rows = await _database.select(_database.characters).get();
    
    return rows.map((row) => _mapToEntity(row)).toList();
  }

  // Проверить, есть ли персонаж в избранном
  Future<bool> isFavorite(int id) async {
    final query = _database.select(_database.characters)
      ..where((tbl) => tbl.id.equals(id));
    
    final result = await query.getSingleOrNull();
    return result != null;
  }

  // Маппер из БД-строки в сущность
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
