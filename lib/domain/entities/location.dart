part of 'entities.dart';

@freezed
abstract class LocationEntity with _$LocationEntity {
  const factory LocationEntity({String? name, String? url}) = _LocationEntity;

  factory LocationEntity.fromJson(Map<String, dynamic> json) =>
      _$LocationEntityFromJson(json);
}
