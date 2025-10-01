part of 'response_models.dart';

@freezed
abstract class CharactersResponse with _$CharactersResponse {
  const factory CharactersResponse({
    required Info info,
    required List<Character> results,
  }) = _CharactersResponse;

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseFromJson(json);
}
