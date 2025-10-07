import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/domain/usecases/character_usecases.dart';
import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/core/utils/app_logger.dart';

part 'characters_state.dart';
part 'characters_cubit.freezed.dart';

@LazySingleton()
class CharactersCubit extends Cubit<CharactersState> {
  final GetCharactersUseCase _getCharactersUseCase;
  final AddToFavoritesUseCase _addToFavoritesUseCase;
  final RemoveFromFavoritesUseCase _removeFromFavoritesUseCase;
  final GetFavoriteIdsUseCase _getFavoriteIdsUseCase;

  int _currentPage = 1;
  bool _isLoadingNextPage = false;
  bool _hasMore = true;
  List<CharacterEntity> _allCharacters = [];
  Set<int> _favoriteIds = {};

  CharactersCubit(
    this._getCharactersUseCase,
    this._addToFavoritesUseCase,
    this._removeFromFavoritesUseCase,
    this._getFavoriteIdsUseCase,
  ) : super(const CharactersState.initial());

  Future<void> fetchCharacters({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _allCharacters = [];
      _hasMore = true;
    } else if (_isLoadingNextPage || !_hasMore) {
      return;
    }
    _isLoadingNextPage = true;
    try {
      if (_currentPage == 1) {
        emit(const CharactersState.loading());
      }

      final characters = await _getCharactersUseCase.call(page: _currentPage);
      _hasMore = characters.length == AppConstants.pageSize;
      _allCharacters = _currentPage == 1
          ? characters
          : [..._allCharacters, ...characters];

      // Получаем все избранные одним запросом (оптимизация!)
      await _updateFavoritesCache();

      // Преобразуем Set в Map для state
      final favoritesMap = {for (var id in _favoriteIds) id: true};

      emit(CharactersState.loaded(_allCharacters, favoritesMap));
      _currentPage++;
    } catch (e, stackTrace) {
      AppLogger.error('Ошибка загрузки персонажей', e, stackTrace);
      emit(CharactersState.error(e.toString()));
    } finally {
      _isLoadingNextPage = false;
    }
  }

  Future<void> loadMoreCharacters() async {
    if (_currentPage > 1 && !_isLoadingNextPage) {
      await fetchCharacters();
    }
  }

  Future<void> refreshCharacters() async {
    await fetchCharacters(refresh: true);
  }

  Future<void> toggleFavorite(CharacterEntity character) async {
    try {
      final isFav = _favoriteIds.contains(character.id);

      // Оптимистичное обновление UI
      if (isFav) {
        _favoriteIds.remove(character.id);
      } else {
        _favoriteIds.add(character.id);
      }

      final favoritesMap = {for (var id in _favoriteIds) id: true};
      emit(CharactersState.loaded(_allCharacters, favoritesMap));

      // Операция в базе
      if (isFav) {
        await _removeFromFavoritesUseCase.call(character.id);
      } else {
        await _addToFavoritesUseCase.call(character);
      }

      // Перезапрос актуального статуса из локального источника
      await _updateFavoritesCache();
      final updatedFavoritesMap = {for (var id in _favoriteIds) id: true};
      emit(CharactersState.loaded(_allCharacters, updatedFavoritesMap));
    } catch (e, stackTrace) {
      AppLogger.error('Ошибка переключения избранного', e, stackTrace);
      // Откатываем изменения при ошибке
      await _updateFavoritesCache();
      final favoritesMap = {for (var id in _favoriteIds) id: true};
      emit(CharactersState.loaded(_allCharacters, favoritesMap));
    }
  }

  /// Оптимизированное обновление кеша избранных - один запрос вместо N
  Future<void> _updateFavoritesCache() async {
    try {
      _favoriteIds = await _getFavoriteIdsUseCase.call();
    } catch (e, stackTrace) {
      AppLogger.error('Ошибка обновления кеша избранных', e, stackTrace);
      _favoriteIds = {};
    }
  }

  Future<void> refreshFavorites() async {
    await _updateFavoritesCache();
    if (state is _Loaded) {
      final loadedState = state as _Loaded;
      emit(
        CharactersState.loaded(loadedState.characters, {
          for (var id in _favoriteIds) id: true,
        }),
      );
    }
  }
}
