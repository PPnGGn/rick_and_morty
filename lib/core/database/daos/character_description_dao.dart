import 'package:drift/drift.dart';
import 'package:rick_and_morty/core/database/database.dart';
import 'package:rick_and_morty/core/database/tables/character_description.dart';

part 'character_description_dao.g.dart';

@DriftAccessor(tables: [CharacterDescriptions])
class CharacterDescriptionDao extends DatabaseAccessor<AppDatabase>
    with _$CharacterDescriptionDaoMixin {
  CharacterDescriptionDao(super.db);

  // Получить описание по ID персонажа
  Future<CharacterDescription?> getDescriptionById(int characterId) {
    return (select(
      characterDescriptions,
    )..where((tbl) => tbl.characterId.equals(characterId))).getSingleOrNull();
  }

  // Сохранить описание
  Future<void> insertDescription(CharacterDescriptionsCompanion entry) {
    return into(characterDescriptions).insert(entry, mode: InsertMode.replace);
  }

  // Удалить описания для не избранных
  Future<void> deleteNonFavorite() {
    return (delete(
      characterDescriptions,
    )..where((tbl) => tbl.isFavorite.equals(false))).go();
  }

  // Обновить статус избранного
  Future<void> updateFavoriteStatus(int characterId, bool isFavorite) {
    return (update(characterDescriptions)
          ..where((tbl) => tbl.characterId.equals(characterId)))
        .write(CharacterDescriptionsCompanion(isFavorite: Value(isFavorite)));
  }
}
