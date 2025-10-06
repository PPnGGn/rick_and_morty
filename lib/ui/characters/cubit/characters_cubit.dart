import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/domain/usecases/character_usecases.dart';

part 'characters_state.dart';
part 'characters_cubit.freezed.dart';

@Injectable()
class CharactersCubit extends Cubit<CharactersState> {
  final GetCharactersUseCase _getCharactersUseCase;
  final AddToFavoritesUseCase _addToFavoritesUseCase;
  final RemoveFromFavoritesUseCase _removeFromFavoritesUseCase;
  final IsFavoriteUseCase _isFavoriteUseCase;

  // Кэш для хранения статуса избранного
  final Map<int, bool> _favoritesCache = {};

  CharactersCubit(
    this._getCharactersUseCase,
    this._addToFavoritesUseCase,
    this._removeFromFavoritesUseCase,
    this._isFavoriteUseCase,
  ) : super(const CharactersState.initial());

  Future<void> fetchCharacters() async {
    debugPrint('Cubit: Начинаем загрузку персонажей...');
    emit(const CharactersState.loading());
    try {
      final characters = await _getCharactersUseCase.call();
      debugPrint('Cubit: Получено персонажей: ${characters.length}');
      // Обновляем кэш избранных
      await _updateFavoritesCache(characters);
      emit(CharactersState.loaded(characters));
      debugPrint('Cubit: Состояние обновлено на loaded');
    } catch (e) {
      debugPrint('Cubit: Ошибка загрузки: $e');
      emit(CharactersState.error(e.toString()));
    }
  }

  Future<void> toggleFavorite(CharacterEntity character) async {
    try {
      final isFav = _favoritesCache[character.id] ?? false;

      // Оптимистичное обновление UI
      _favoritesCache[character.id] = !isFav;
      _updateCharactersState();

      // Выполняем операцию с хранилищем
      if (isFav) {
        await _removeFromFavoritesUseCase.call(character.id);
      } else {
        await _addToFavoritesUseCase.call(character);
      }

      // Обновляем кэш на случай, если что-то пошло не так
      _favoritesCache[character.id] = await _isFavoriteUseCase.call(
        character.id,
      );
      _updateCharactersState();
    } catch (e) {
      // В случае ошибки обновляем состояние, чтобы отобразить актуальные данные
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
        if (forceRefresh) {
          // Если нужно принудительное обновление, обновляем весь список
          emit(CharactersState.loaded([...characters]));
        } else {
          // Иначе просто уведомляем об изменении состояния
          emit(CharactersState.loaded(characters));
        }
      },
      orElse: () {},
    );
  }
}
