part of 'entities.dart';


@freezed
abstract class CharactersEntity with _$CharactersEntity {
  const factory CharactersEntity({
     required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    OriginEntity? origin,
    LocationEntity? location,
    required String image,
    required List<String> episode,
    required String url,
  }) = _CharactersEntity;
  

  factory CharactersEntity.fromJson(Map<String, dynamic> json) =>
      _$CharactersEntityFromJson(json);
}

