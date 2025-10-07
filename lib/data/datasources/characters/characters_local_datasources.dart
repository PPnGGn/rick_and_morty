import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/database/database.dart';
import 'package:drift/drift.dart';
import 'package:rick_and_morty/data/models/local/character_local_model.dart';
import 'package:rick_and_morty/core/utils/app_logger.dart';

@lazySingleton
class CharacterLocalDataSource {
  final AppDatabase _database;

  CharacterLocalDataSource(this._database);

  /// Кеширование персонажей из API
  /// Принимает готовые модели для БД
  Future<void> cacheCharacters(List<CharacterLocalModel> characters) async {
    AppLogger.info(
      'Начало кеширования персонажей, количество: ${characters.length}',
    );

    if (characters.isEmpty) return;

    try {
      // Получаем все существующие ID одним запросом
      final existingIds =
          await (_database.selectOnly(
            _database.characters,
          )..addColumns([_database.characters.id])).get().then(
            (rows) => rows.map((r) => r.read(_database.characters.id)!).toSet(),
          );

      await _database.transaction(() async {
        // Разделяем на новые и существующие
        final toInsert = <CharacterLocalModel>[];
        final toUpdate = <CharacterLocalModel>[];

        for (final character in characters) {
          if (existingIds.contains(character.id)) {
            toUpdate.add(character);
          } else {
            toInsert.add(character);
          }
        }

        // Batch insert новых
        if (toInsert.isNotEmpty) {
          await _database.batch((batch) {
            for (final char in toInsert) {
              batch.insert(
                _database.characters,
                CharactersCompanion(
                  id: Value(char.id),
                  name: Value(char.name),
                  status: Value(char.status),
                  species: Value(char.species),
                  type: Value(char.type),
                  gender: Value(char.gender),
                  originName: Value(char.originName),
                  originUrl: Value(char.originUrl),
                  locationName: Value(char.locationName),
                  locationUrl: Value(char.locationUrl),
                  image: Value(char.image),
                  episode: Value(char.episode),
                  url: Value(char.url),
                  cachedAt: Value(DateTime.now()),
                  isFavorite: const Value(false),
                ),
              );
            }
          });
          AppLogger.info('Добавлено новых персонажей: ${toInsert.length}');
        }

        // Batch update существующих (сохраняем статус избранного)
        if (toUpdate.isNotEmpty) {
          await _database.batch((batch) {
            for (final char in toUpdate) {
              batch.update(
                _database.characters,
                CharactersCompanion(
                  name: Value(char.name),
                  status: Value(char.status),
                  species: Value(char.species),
                  type: Value(char.type),
                  gender: Value(char.gender),
                  originName: Value(char.originName),
                  originUrl: Value(char.originUrl),
                  locationName: Value(char.locationName),
                  locationUrl: Value(char.locationUrl),
                  image: Value(char.image),
                  episode: Value(char.episode),
                  url: Value(char.url),
                  cachedAt: Value(DateTime.now()),
                ),
                where: (_) => _database.characters.id.equals(char.id),
              );
            }
          });
          AppLogger.info('Обновлено персонажей: ${toUpdate.length}');
        }
      });

      AppLogger.info('Кеширование завершено успешно');
    } catch (e, stackTrace) {
      AppLogger.error('Ошибка кеширования персонажей', e, stackTrace);
      rethrow;
    }
  }

  /// Получить персонажей из кеша с поддержкой пагинации
  /// [page] - номер страницы (начинается с 1)
  /// [pageSize] - количество элементов на странице
  Future<List<CharacterLocalModel>> getCachedCharacters({
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final query = _database.select(_database.characters)
        ..orderBy([(t) => OrderingTerm(expression: t.id)])
        ..limit(pageSize, offset: (page - 1) * pageSize);

      final rows = await query.get();
      AppLogger.info(
        'Загружено из кеша: ${rows.length} персонажей (страница $page, размер $pageSize)',
      );
      return rows.map((row) => CharacterLocalModel.fromDb(row)).toList();
    } catch (e, stackTrace) {
      AppLogger.error('Ошибка чтения персонажей из кеша', e, stackTrace);
      rethrow;
    }
  }

  /// Получить персонажа из кеша по id
  Future<CharacterLocalModel?> getCachedCharacter(int id) async {
    try {
      final result = await (_database.select(
        _database.characters,
      )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
      return result != null ? CharacterLocalModel.fromDb(result) : null;
    } catch (e, stackTrace) {
      AppLogger.error('Ошибка чтения персонажа $id из кеша', e, stackTrace);
      return null;
    }
  }

  /// Очистить кеш (оставить только избранных)
  Future<void> clearCache() async {
    await (_database.delete(
      _database.characters,
    )..where((tbl) => tbl.isFavorite.equals(false))).go();
  }

  /// Проверить, есть ли кеш
  /// [page] - номер страницы для проверки (опционально)
  /// [pageSize] - размер страницы (по умолчанию 20)
  /// Если page не указан, проверяет наличие любых данных в кеше
  Future<bool> hasCachedData({int? page, int pageSize = 20}) async {
    final count = await (_database.selectOnly(
      _database.characters,
    )..addColumns([_database.characters.id.count()])).getSingle();
    
    final totalCount = count.read(_database.characters.id.count()) ?? 0;
    
    // Если page не указан, просто проверяем наличие данных
    if (page == null) {
      return totalCount > 0;
    }
    
    // Проверяем, достаточно ли данных для запрашиваемой страницы
    final requiredCount = (page - 1) * pageSize;
    final hasEnoughData = totalCount > requiredCount;
    
    AppLogger.info(
      'Проверка кеша: всего $totalCount записей, требуется минимум $requiredCount для страницы $page',
    );
    
    return hasEnoughData;
  }

  // ==== ИЗБРАННОЕ ====

  /// Добавить в избранное
  Future<void> addToFavorites(CharacterLocalModel character) async {
    try {
      await _database
          .into(_database.characters)
          .insertOnConflictUpdate(
            CharactersCompanion(
              id: Value(character.id),
              name: Value(character.name),
              status: Value(character.status),
              species: Value(character.species),
              type: Value(character.type),
              gender: Value(character.gender),
              originName: Value(character.originName),
              originUrl: Value(character.originUrl),
              locationName: Value(character.locationName),
              locationUrl: Value(character.locationUrl),
              image: Value(character.image),
              episode: Value(character.episode),
              url: Value(character.url),
              cachedAt: Value(DateTime.now()),
              isFavorite: const Value(true),
            ),
          );
      AppLogger.info('Персонаж ${character.name} добавлен в избранное');
    } catch (e, stackTrace) {
      AppLogger.error('Ошибка добавления в избранное', e, stackTrace);
      rethrow;
    }
  }

  /// Удалить из избранного (сбросить флаг, но не удалять из кеша)
  Future<void> removeFromFavorites(int id) async {
    try {
      await (_database.update(_database.characters)
            ..where((tbl) => tbl.id.equals(id)))
          .write(const CharactersCompanion(isFavorite: Value(false)));
      AppLogger.info('Персонаж $id удален из избранного');
    } catch (e, stackTrace) {
      AppLogger.error('Ошибка удаления из избранного', e, stackTrace);
      rethrow;
    }
  }

  /// Получить только избранных
  Future<List<CharacterLocalModel>> getFavorites() async {
    try {
      final rows = await (_database.select(
        _database.characters,
      )..where((tbl) => tbl.isFavorite.equals(true))).get();
      AppLogger.info('Найдено избранных персонажей: ${rows.length}');
      return rows.map((row) => CharacterLocalModel.fromDb(row)).toList();
    } catch (e, stackTrace) {
      AppLogger.error('Ошибка чтения избранных', e, stackTrace);
      rethrow;
    }
  }

  /// Проверить, избранный ли персонаж
  Future<bool> isFavorite(int id) async {
    try {
      final result =
          await (_database.select(_database.characters)..where(
                (tbl) => tbl.id.equals(id) & tbl.isFavorite.equals(true),
              ))
              .getSingleOrNull();
      return result != null;
    } catch (e, stackTrace) {
      AppLogger.error('Ошибка проверки избранного для $id', e, stackTrace);
      return false;
    }
  }

  /// Получить список ID всех избранных (оптимизированный запрос)
  Future<Set<int>> getFavoriteIds() async {
    try {
      final rows =
          await (_database.selectOnly(_database.characters)
                ..addColumns([_database.characters.id])
                ..where(_database.characters.isFavorite.equals(true)))
              .get();
      return rows.map((r) => r.read(_database.characters.id)!).toSet();
    } catch (e, stackTrace) {
      AppLogger.error('Ошибка чтения ID избранных', e, stackTrace);
      return {};
    }
  }
}
