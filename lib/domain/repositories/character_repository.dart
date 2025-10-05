import 'package:rick_and_morty/domain/entities/entities.dart';

abstract class CharacterRepository {
  Future<List<CharacterEntity>> getCharacters();
  Future<CharacterEntity?> getCharacter(int id);

  // избранное из локалки
  Future<void> addToFavorites(CharacterEntity character);
  Future<void> removeFromFavorites(int id);
  Future<List<CharacterEntity>> getFavorites();
  Future<bool> isFavorite(int id);
}
