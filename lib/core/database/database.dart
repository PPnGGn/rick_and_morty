import 'package:drift/drift.dart';
import 'package:rick_and_morty/core/database/tables/characters.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Characters])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Миграция с версии 1 на 2
      if (from == 1) {}
    },
  );
}
