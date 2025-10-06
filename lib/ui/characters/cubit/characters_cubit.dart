import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/domain/usecases/character_usecases.dart';

part 'characters_state.dart';
part 'characters_cubit.freezed.dart';

@LazySingleton()
class CharactersCubit extends Cubit<CharactersState> {
  final GetCharactersUseCase _getCharactersUseCase;
  final AddToFavoritesUseCase _addToFavoritesUseCase;
  final RemoveFromFavoritesUseCase _removeFromFavoritesUseCase;
  final IsFavoriteUseCase _isFavoriteUseCase;

  // Пагинация и кэш
  int _currentPage = 1;
  bool _isLoadingNextPage = false;
  bool _hasMore = true;
  List<CharacterEntity> _allCharacters = [];

  // Кэш для хранения статуса избранного
  final Map<int, bool> _favoritesCache = {};

  CharactersCubit(
    this._getCharactersUseCase,
    this._addToFavoritesUseCase,
    this._removeFromFavoritesUseCase,
    this._isFavoriteUseCase,
  ) : super(const CharactersState.initial());

  Future<void> fetchCharacters({bool refresh = false}) async {
    debugPrint('Cubit: Начинаем загрузку персонажей...');
    
    if (refresh) {
      _currentPage = 1;
      _allCharacters = [];
      _hasMore = true;
    } else if (_isLoadingNextPage || !_hasMore) {
      return; // Уже загружаем или больше нечего грузить
    }
    
    _isLoadingNextPage = true;
    
    try {
      if (_currentPage == 1) {
        emit(const CharactersState.loading());
      }
      
      debugPrint('Cubit: Загрузка страницы $_currentPage');
      final characters = await _getCharactersUseCase.call(page: _currentPage);
      
      // Обновляем флаг hasMore на основе количества полученных записей
      _hasMore = characters.length == 20; // Если получили 20 записей, возможно, есть еще
      
      debugPrint('Cubit: Получено ${characters.length} персонажей. Есть еще данные: $_hasMore');
      
      // Обновляем список персонажей
      _allCharacters = _currentPage == 1 
          ? characters 
          : [..._allCharacters, ...characters];
      
      await _updateFavoritesCache(_allCharacters);
      
      // Обновляем состояние
      emit(CharactersState.loaded(_allCharacters));
      
      // Увеличиваем номер страницы только после успешной загрузки
      _currentPage++;
      
    } catch (e) {
      debugPrint('Cubit: Ошибка загрузки: $e');
      emit(CharactersState.error(e.toString()));
    } finally {
      _isLoadingNextPage = false;
    }
  }

  Future<void> loadMoreCharacters() async {
    // Используем fetchCharacters для загрузки следующей страницы
    // чтобы избежать дублирования кода
    if (_currentPage > 1) {
      await fetchCharacters();
    }
  }

  Future<void> refreshCharacters() async {
    await fetchCharacters(refresh: true);
  }

  Future<void> toggleFavorite(CharacterEntity character) async {
    try {
      final isFav = _favoritesCache[character.id] ?? false;

      // Оптимистичное обновление UI
      _favoritesCache[character.id] = !isFav;
      // Форсируем перерисовку списка, чтобы обновился цвет звезды
      _updateCharactersState(forceRefresh: true);

      // Выполняем операцию с хранилищем
      if (isFav) {
        await _removeFromFavoritesUseCase.call(character.id);
      } else {
        await _addToFavoritesUseCase.call(character);
      }

      // Обновляем кэш на случай ошибки
      _favoritesCache[character.id] = await _isFavoriteUseCase.call(
        character.id,
      );
      // Гарантируем обновление UI после подтверждения статуса
      _updateCharactersState(forceRefresh: true);
    } catch (e) {
      _updateCharactersState(forceRefresh: true);
      rethrow;
    }
  }

  Future<bool> isFavorite(int characterId) async {
    if (_favoritesCache.containsKey(characterId)) {
      return _favoritesCache[characterId]!;
    }
    try {
      final isFav = await _isFavoriteUseCase.call(characterId);
      _favoritesCache[characterId] = isFav;
      return isFav;
    } catch (_) {
      return false;
    }
  }

  /// Синхронное получение статуса избранного из кэша
  bool? isFavoriteSync(int characterId) {
    return _favoritesCache[characterId];
  }

  Future<void> _updateFavoritesCache(List<CharacterEntity> characters) async {
    for (final character in characters) {
      if (!_favoritesCache.containsKey(character.id)) {
        _favoritesCache[character.id] = await _isFavoriteUseCase.call(
          character.id,
        );
      }
    }
  }

  void _updateCharactersState({bool forceRefresh = false}) {
    state.maybeWhen(
      loaded: (characters) {
        // При forceRefresh создаем новую коллекцию, чтобы гарантировать rebuild
        emit(CharactersState.loaded(
          forceRefresh ? [...characters] : characters,
        ));
      },
      orElse: () {},
    );
  }

  /// Применить внешнее изменение статуса избранного (например, с вкладки Избранное)
  /// Обновляет внутренний кэш и форсирует перерисовку списка
  void applyExternalFavoriteChange(int characterId, bool isFavorite) {
    _favoritesCache[characterId] = isFavorite;
    _updateCharactersState(forceRefresh: true);
  }
}
