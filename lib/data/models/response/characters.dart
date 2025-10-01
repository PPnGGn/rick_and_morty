part of 'response_models.dart';

@freezed
abstract class Characters with _$Characters {
  const factory Characters({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    Origin? origin,
    Location? location,
    required String image,
    required List<String> episode,
    required String url,
  }) = _Characters;

  factory Characters.fromJson(Map<String, dynamic> json) =>
      _$CharactersFromJson(json);
}

// --- Маппер из модели в сущность
extension CharactersModelMapper on Characters {
  CharactersEntity toEntity() {
    return CharactersEntity(
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


