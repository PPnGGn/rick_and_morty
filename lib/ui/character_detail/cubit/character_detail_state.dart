part of 'character_detail_cubit.dart';

@freezed
class CharacterDetailState with _$CharacterDetailState {
  const factory CharacterDetailState.initial() = _Initial;

  const factory CharacterDetailState.loadingCharacter() = _LoadingCharacter;

  const factory CharacterDetailState.characterLoaded({
    required CharacterEntity character,
  }) = _CharacterLoaded;

  const factory CharacterDetailState.loadingDescription({
    required CharacterEntity character,
  }) = _LoadingDescription;

  const factory CharacterDetailState.streaming({
    required CharacterEntity character,
    required String partialText,
  }) = _Streaming;

  const factory CharacterDetailState.loaded({
    required CharacterEntity character,
    required String fullText,
  }) = _Loaded;

  const factory CharacterDetailState.error({required String message}) = _Error;
}
