import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/database/daos/character_description_dao.dart';
import 'package:rick_and_morty/core/database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase(file);
  });
}

@module
abstract class DBModule {
  @lazySingleton
  AppDatabase appDatabase() => AppDatabase(_openConnection());

  @lazySingleton
  CharacterDescriptionDao characterDescriptionDao(AppDatabase db) =>
      db.characterDescriptionDao;
}
