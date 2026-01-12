import 'package:drift/drift.dart';
import 'package:rick_and_morty/core/database/daos/character_description_dao.dart';
import 'package:rick_and_morty/core/database/tables/characters.dart';
import 'package:rick_and_morty/core/database/tables/character_description.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Characters, CharacterDescriptions])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 3; // ← Было 2, стало 3

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Миграция с версии 1 на 2
      if (from == 1 && to == 2) {
    
      }

      // Миграция с версии 2 на 3 (добавляем таблицу описаний)
      if (from == 2 && to == 3) {
        await m.createTable(characterDescriptions);
      }
    },
  );

  CharacterDescriptionDao get characterDescriptionDao =>
      CharacterDescriptionDao(this);
}
