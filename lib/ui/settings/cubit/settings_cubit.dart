import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState.initial());

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getString('app_theme_mode') == 'dark';
    emit(SettingsState.loaded(isDark: isDark));
  }

  /// Изменяет тему приложения и сохраняет выбор в SharedPreferences
  Future<void> changeTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('app_theme_mode', isDark ? 'dark' : 'light');
    emit(SettingsState.loaded(isDark: isDark));
  }
}
