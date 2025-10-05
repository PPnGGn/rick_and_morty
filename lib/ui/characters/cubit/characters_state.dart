part of 'characters_cubit.dart';

@freezed
class CharactersState with _$CharactersState {
  const factory CharactersState.initial() = _Initial;
  const factory CharactersState.loading() = _Loading;
  const factory CharactersState.loaded(List<CharacterEntity> characters) = _Loaded;
  const factory CharactersState.error(String error) = _Error;
}
