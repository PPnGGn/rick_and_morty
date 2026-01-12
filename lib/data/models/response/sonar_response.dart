part of 'response_models.dart';

@freezed
abstract class SonarResponse with _$SonarResponse {
  factory SonarResponse({
    required String response,
    List<String>? images,
    @JsonKey(name: 'citations') List<Citation>? sources,
  }) = _SonarResponse;
  factory SonarResponse.fromJson(Map<String, dynamic> json) =>
      _$SonarResponseFromJson(json);
}
