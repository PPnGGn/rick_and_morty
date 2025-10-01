part of 'response_models.dart';

@freezed
abstract class Origin with _$Origin {
  const factory Origin({
    String? name,
    String? url,
  }) = _Origin;

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);
}

extension OriginModelMapper on Origin {
  OriginEntity toEntity() {
    return OriginEntity(
      name: name,
      url: url,
    );
  }
}
