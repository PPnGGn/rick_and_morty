part of 'response_models.dart';

@freezed
abstract class Location with _$Location {
  const factory Location({
    String? name,
    String? url,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

extension LocationModelMapper on Location {
  LocationEntity toEntity() {
    return LocationEntity(
      name: name,
      url: url,
    );
  }
}