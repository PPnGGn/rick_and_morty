import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/data/datasources/characters/characters_local_datasources.dart';
import 'package:rick_and_morty/data/models/response/response_models.dart';
import 'package:rick_and_morty/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/data/datasources/characters/characters_remote_datasource.dart';

@LazySingleton(as: CharacterRepository)
class CharacterRepositoryImpl implements CharacterRepository {
  final CharactersRemoteDatasource _remote;
  final CharacterLocalDataSource _local;

  CharacterRepositoryImpl(this._remote, this._local);
  // персонажи из сети
  @override
  Future<List<CharacterEntity>> getCharacters() async {
    final response = await _remote.getAllCharacters();
    return response.results.map((character) => character.toEntity()).toList();
  }

  @override
  Future<CharacterEntity?> getCharacter(int id) async {
    final model = await _remote.getCharacterById(id);
    return model.toEntity();
  }

  // избранное из локалки
  @override
  Future<void> addToFavorites(CharacterEntity character) =>
      _local.addToFavorites(character);

  @override
  Future<void> removeFromFavorites(int id) => _local.removeFromFavorites(id);

  @override
  Future<List<CharacterEntity>> getFavorites() => _local.getFavorites();

  @override
  Future<bool> isFavorite(int id) => _local.isFavorite(id);
}
