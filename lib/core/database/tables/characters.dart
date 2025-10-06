import 'package:drift/drift.dart';

class Characters extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get status => text()();
  TextColumn get species => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get gender => text()();
  TextColumn get originName => text().nullable()();
  TextColumn get originUrl => text().nullable()();
  TextColumn get locationName => text().nullable()();
  TextColumn get locationUrl => text().nullable()();
  TextColumn get image => text()();
  TextColumn get episode => text().nullable()();
  TextColumn get url => text().nullable()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();

  // для времени кеширования
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
