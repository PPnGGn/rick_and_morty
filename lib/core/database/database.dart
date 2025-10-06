import 'package:drift/drift.dart';
import 'package:rick_and_morty/core/database/tables/characters.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Characters])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 2;
}
