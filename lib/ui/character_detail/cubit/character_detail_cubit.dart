import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/domain/repositories/sonar_repository.dart';

part 'character_detail_state.dart';
part 'character_detail_cubit.freezed.dart';

@injectable
class CharacterDetailCubit extends Cubit<CharacterDetailState> {
  final CharacterRepository _characterRepository;
  final SonarRepository _sonarRepository;
  StreamSubscription? _streamSubscription;

  CharacterDetailCubit(this._characterRepository, this._sonarRepository)
    : super(const CharacterDetailState.initial());

  // Загрузить персонажа по ID и затем его описание
  Future<void> loadCharacterById(int id) async {
    try {
      emit(const CharacterDetailState.loadingCharacter());

      // Загружаем персонажа из репозитория
      final character = await _characterRepository.getCharacter(id);

      if (character == null) {
        emit(const CharacterDetailState.error(message: 'Персонаж не найден'));
        return;
      }

      emit(CharacterDetailState.characterLoaded(character: character));

      // Автоматически начинаем загрузку описания
      await loadDescription(character);
    } catch (e) {
      emit(CharacterDetailState.error(message: e.toString()));
    }
  }

  // Загрузить описание для уже загруженного персонажа
  Future<void> loadDescription(CharacterEntity character) async {
    _streamSubscription?.cancel();

    emit(CharacterDetailState.loadingDescription(character: character));

    String accumulatedText = '';

    try {
      _streamSubscription = _sonarRepository
          .getCharacterDescription(character)
          .listen(
            (chunk) {
              accumulatedText += chunk;

              emit(
                CharacterDetailState.streaming(
                  character: character,
                  partialText: accumulatedText,
                ),
              );
            },
            onError: (error) {
              emit(CharacterDetailState.error(message: error.toString()));
            },
            onDone: () {
              emit(
                CharacterDetailState.loaded(
                  character: character,
                  fullText: accumulatedText,
                ),
              );
            },
          );
    } catch (e) {
      emit(CharacterDetailState.error(message: e.toString()));
    }
  }

  void reset() {
    _streamSubscription?.cancel();
    emit(const CharacterDetailState.initial());
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
