import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/domain/enums/enums.dart';
import 'package:rick_and_morty/domain/usecases/character_usecases.dart';

part 'favorites_state.dart';
part 'favorites_cubit.freezed.dart';

@Injectable()
class FavoritesCubit extends Cubit<FavoritesState> {
  final GetFavoritesUseCase _getFavoritesUseCase;
  final RemoveFromFavoritesUseCase _removeFromFavoritesUseCase;

  List<CharacterEntity> _allFavorites = [];
  CharacterStatus? _statusFilter;
  CharacterGender? _genderFilter;

  FavoritesCubit(this._getFavoritesUseCase, this._removeFromFavoritesUseCase)
    : super(const FavoritesState.initial());

  Future<void> fetchFavorites() async {
    emit(const FavoritesState.loading());
    try {
      final favorites = await _getFavoritesUseCase();
      _allFavorites = favorites;
      emit(FavoritesState.loaded(_applyFilters(_allFavorites)));
    } catch (e) {
      emit(FavoritesState.error(e.toString()));
    }
  }

  Future<void> removeFavorite(int id) async {
    try {
      await _removeFromFavoritesUseCase(id);
      await fetchFavorites();
    } catch (e) {
      emit(FavoritesState.error(e.toString()));
    }
  }

  void setStatusFilter(CharacterStatus? status) {
    _statusFilter = status;
    emit(FavoritesState.loaded(_applyFilters(_allFavorites)));
  }

  void setGenderFilter(CharacterGender? gender) {
    _genderFilter = gender;
    emit(FavoritesState.loaded(_applyFilters(_allFavorites)));
  }

  void resetFilters() {
    _statusFilter = null;
    _genderFilter = null;
    emit(FavoritesState.loaded(_allFavorites));
  }

  List<CharacterEntity> _applyFilters(List<CharacterEntity> list) {
    return list.where((character) {
      final statusMatch =
          _statusFilter == null || character.status == _statusFilter;
      final genderMatch =
          _genderFilter == null || character.gender == _genderFilter;
      return statusMatch && genderMatch;
    }).toList();
  }

  CharacterStatus? get statusFilter => _statusFilter;
  CharacterGender? get genderFilter => _genderFilter;
}
