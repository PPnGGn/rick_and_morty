import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/data/datasources/characters/characters_local_datasources.dart';
import 'package:rick_and_morty/data/datasources/characters/characters_remote_datasource.dart';
import 'package:rick_and_morty/data/models/response/response_models.dart';
import 'package:rick_and_morty/data/models/local/character_local_model.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/core/utils/app_logger.dart';

@LazySingleton(as: CharacterRepository)
class CharacterRepositoryImpl implements CharacterRepository {
  final CharactersRemoteDatasource _remote;
  final CharacterLocalDataSource _local;

  CharacterRepositoryImpl(this._remote, this._local);

@override
Future<List<CharacterEntity>> getCharacters({
  int page = 1,
  String? name,
  String? status,
}) async {
  try {
    final response = await _remote.getAllCharacters(
      page: page,
      name: name,
      status: status,
    );

    // Преобразуем response models в entities
    final characters = response.results
        .map((model) => model.toEntity())
        .toList();
    AppLogger.info('Загружено из сети: ${characters.length} персонажей');

    // Кешируем все загруженные персонажи (без фильтров)
    // Фильтрованные результаты не кешируем, так как они могут быть неполными
    if (name == null && status == null) {
      AppLogger.info('Кешируем данные (страница $page)');
      // Преобразуем entities в local models для кеширования
      final localModels = characters
          .map((entity) => CharacterLocalModel.fromEntity(entity))
          .toList();
      await _local.cacheCharacters(localModels);
    } else {
      AppLogger.info('Пропускаем кеширование - применены фильтры');
    }
    return characters;
  } catch (e, stackTrace) {
    AppLogger.error('Ошибка загрузки из сети', e, stackTrace);
    AppLogger.info('Пробуем загрузить из кеша');

    // Загружаем из кеша с учетом пагинации
    final cachedModels = await _local.getCachedCharacters(page: page);
    
    if (cachedModels.isEmpty) {
      // Возвращаем пустой список вместо выброса исключения
      AppLogger.info('Достигнут конец кешированных данных (страница $page)');
      return [];
    }

    final cached = cachedModels.map((model) => model.toEntity()).toList();
    AppLogger.info('Загружено из кеша: ${cached.length} персонажей (страница $page)');
    return cached;
  }
}

  @override
  Future<CharacterEntity?> getCharacter(int id) async {
    try {
      final model = await _remote.getCharacterById(id);
      final entity = model.toEntity();

      // Кешируем
      final localModel = CharacterLocalModel.fromEntity(entity);
      await _local.cacheCharacters([localModel]);
      return entity;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Ошибка сети. Загружаем персонажа из кеша',
        e,
        stackTrace,
      );
      final cachedModel = await _local.getCachedCharacter(id);
      return cachedModel?.toEntity();
    }
  }

  @override
  Future<void> addToFavorites(CharacterEntity character) async {
    final localModel = CharacterLocalModel.fromEntity(
      character,
      isFavorite: true,
    );
    await _local.addToFavorites(localModel);
  }

  @override
  Future<void> removeFromFavorites(int id) => _local.removeFromFavorites(id);

  @override
  Future<List<CharacterEntity>> getFavorites() async {
    final localModels = await _local.getFavorites();
    return localModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<bool> isFavorite(int id) => _local.isFavorite(id);

  @override
  Future<Set<int>> getFavoriteIds() => _local.getFavoriteIds();

  @override
  Future<void> clearCache() => _local.clearCache();

  @override
  Future<bool> hasCachedData({int? page, int pageSize = 20}) => 
      _local.hasCachedData(page: page, pageSize: pageSize);

  @override
  Future<List<CharacterEntity>> refreshCharacters() async {
    try {
      AppLogger.info('Принудительное обновление персонажей');
      final response = await _remote.getAllCharacters(page: 1);
      final characters = response.results.map((c) => c.toEntity()).toList();

      // Преобразуем и кешируем
      final localModels = characters
          .map((entity) => CharacterLocalModel.fromEntity(entity))
          .toList();
      await _local.cacheCharacters(localModels);

      return characters;
    } catch (e, stackTrace) {
      AppLogger.error('Не удалось обновить персонажей', e, stackTrace);
      throw Exception('Не удалось обновить персонажей: $e');
    }
  }
}
