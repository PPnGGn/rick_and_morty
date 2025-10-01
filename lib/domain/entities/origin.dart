part of 'entities.dart';

@freezed
abstract class OriginEntity with _$OriginEntity {
  const factory OriginEntity({
    String? name,
    String? url,
  }) = _OriginEntity;

  factory OriginEntity.fromJson(Map<String, dynamic> json) => _$OriginEntityFromJson(json);
}
