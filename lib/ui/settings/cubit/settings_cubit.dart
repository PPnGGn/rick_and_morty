import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/domain/repositories/settings_repository.dart';
import 'package:rick_and_morty/core/utils/app_logger.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _repository;

  SettingsCubit(this._repository) : super(const SettingsState.initial());

  /// Загрузить настройки
  Future<void> load() async {
    try {
      final isDark = await _repository.getThemeMode();
      emit(SettingsState.loaded(isDark: isDark));
    } catch (e, stackTrace) {
      AppLogger.error('Ошибка загрузки настроек', e, stackTrace);
      // В случае ошибки используем светлую тему
      emit(const SettingsState.loaded(isDark: false));
    }
  }

  /// Изменить тему приложения
  Future<void> changeTheme(bool isDark) async {
    try {
      await _repository.setThemeMode(isDark);
      emit(SettingsState.loaded(isDark: isDark));
    } catch (e, stackTrace) {
      AppLogger.error('Ошибка изменения темы', e, stackTrace);
    }
  }
}
