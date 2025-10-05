import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/domain/repositories/character_repository.dart';

@lazySingleton
class GetCharactersUseCase {
  final CharacterRepository _repository;
  GetCharactersUseCase(this._repository);
  Future<List<CharacterEntity>> call() => _repository.getCharacters();
}

@lazySingleton
class GetCharacterUseCase {
  final CharacterRepository _repository;
  GetCharacterUseCase(this._repository);
  Future<CharacterEntity?> call(int id) => _repository.getCharacter(id);
}

@lazySingleton
class AddToFavoritesUseCase {
  final CharacterRepository _repository;
  AddToFavoritesUseCase(this._repository);
  Future<void> call(CharacterEntity character) =>
      _repository.addToFavorites(character);
}

@lazySingleton
class RemoveFromFavoritesUseCase {
  final CharacterRepository _repository;
  RemoveFromFavoritesUseCase(this._repository);
  Future<void> call(int id) => _repository.removeFromFavorites(id);
}

@lazySingleton
class GetFavoritesUseCase {
  final CharacterRepository _repository;
  GetFavoritesUseCase(this._repository);
  Future<List<CharacterEntity>> call() => _repository.getFavorites();
}

@lazySingleton
class IsFavoriteUseCase {
  final CharacterRepository _repository;
  IsFavoriteUseCase(this._repository);
  Future<bool> call(int id) => _repository.isFavorite(id);
}
