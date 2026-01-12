import 'package:drift/drift.dart';

class CharacterDescriptions extends Table {
  IntColumn get characterId => integer()();
  TextColumn get description => text()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {characterId};
}
