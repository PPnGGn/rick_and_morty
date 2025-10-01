part of 'response_models.dart';

@freezed
abstract class Character with _$Character {
  const factory Character({
    required int id,
    required String name,
    required CharacterStatus status,
    required String species,
    required String type,
    required CharacterGender gender,
    Origin? origin,
    Location? location,
    required String image,
    required List<String> episode,
    required String url,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}

// --- Маппер из модели в сущность
extension CharactersModelMapper on Character {
  CharacterEntity toEntity() {
    return CharacterEntity(
      id: id,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      origin: origin?.toEntity(),
      location: location?.toEntity(),
      image: image,
      episode: episode,
      url: url,
    );
  }
}
