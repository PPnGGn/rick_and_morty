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

  int _currentPage = 1;
  bool _isLoadingNextPage = false;
  bool _hasMore = true;
  List<CharacterEntity> _allCharacters = [];
  final Map<int, bool> _favoritesCache = {};

  CharactersCubit(
    this._getCharactersUseCase,
    this._addToFavoritesUseCase,
    this._removeFromFavoritesUseCase,
    this._isFavoriteUseCase,
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
      _hasMore = characters.length == 20;
      _allCharacters = _currentPage == 1
          ? characters
          : [..._allCharacters, ...characters];

      // Актуализируем статус избранного для всех видимых персонажей
      await _updateFavoritesCache(_allCharacters);
      emit(CharactersState.loaded(_allCharacters, Map.of(_favoritesCache)));
      _currentPage++;
    } catch (e) {
      emit(CharactersState.error(e.toString()));
    } finally {
      _isLoadingNextPage = false;
    }
  }

  Future<void> loadMoreCharacters() async {
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
      emit(CharactersState.loaded(_allCharacters, Map.of(_favoritesCache)));

      // Операция в базе
      if (isFav) {
        await _removeFromFavoritesUseCase.call(character.id);
      } else {
        await _addToFavoritesUseCase.call(character);
      }

      // Перезапрос актуального статуса из локального источника
      _favoritesCache[character.id] = await _isFavoriteUseCase.call(character.id);
      emit(CharactersState.loaded(_allCharacters, Map.of(_favoritesCache)));
    } catch (e) {
      emit(CharactersState.loaded(_allCharacters, Map.of(_favoritesCache)));
      rethrow;
    }
  }

  Future<void> _updateFavoritesCache(List<CharacterEntity> characters) async {
    for (final character in characters) {
      _favoritesCache[character.id] = await _isFavoriteUseCase.call(character.id);
    }
  }
}
