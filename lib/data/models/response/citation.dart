part of 'response_models.dart';

@freezed
abstract class Citation with _$Citation {
  factory Citation({
    required String url,
    String? title,
    String? text, // фрагмент текста из источника
  }) = _Citation;

  factory Citation.fromJson(Map<String, dynamic> json) =>
      _$CitationFromJson(json);
}
