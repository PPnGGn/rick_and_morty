import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/domain/usecases/character_usecases.dart';

part 'favorites_state.dart';
part 'favorites_cubit.freezed.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final GetFavoritesUseCase _getFavoritesUseCase;
  final RemoveFromFavoritesUseCase _removeFromFavoritesUseCase;

  FavoritesCubit(this._getFavoritesUseCase, this._removeFromFavoritesUseCase)
    : super(const FavoritesState.initial());

  Future<void> fetchFavorites() async {
    emit(const FavoritesState.loading());
    try {
      final favorites = await _getFavoritesUseCase();
      emit(FavoritesState.loaded(favorites));
    } catch (e) {
      emit(FavoritesState.error(e.toString()));
    }
  }

  Future<void> removeFavorite(int id) async {
    try {
      await _removeFromFavoritesUseCase(id);
      // Можешь сразу fetchFavorites после удаления.
    } catch (e) {
      emit(FavoritesState.error(e.toString()));
    }
  }
}
