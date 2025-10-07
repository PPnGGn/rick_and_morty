import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/core/utils/app_logger.dart';

/// Локальный источник данных для настроек
@lazySingleton
class SettingsLocalDataSource {
  /// Получить режим темы из SharedPreferences
  Future<bool> getThemeMode() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeStr = prefs.getString(PrefsKeys.themeMode);

      // Если настройка не установлена, используем системную тему
      if (themeStr == null) {
        return WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
      }

      final isDark = themeStr == ThemeValues.dark;
      AppLogger.info('Загружена тема: ${isDark ? "тёмная" : "светлая"}');
      return isDark;
    } catch (e, stackTrace) {
      AppLogger.error('Ошибка загрузки настроек темы', e, stackTrace);
      return false;
    }
  }

  /// Сохранить режим темы в SharedPreferences
  Future<void> setThemeMode(bool isDark) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final value = isDark ? ThemeValues.dark : ThemeValues.light;
      await prefs.setString(PrefsKeys.themeMode, value);
      AppLogger.info('Сохранена тема: ${isDark ? "тёмная" : "светлая"}');
    } catch (e, stackTrace) {
      AppLogger.error('Ошибка сохранения настроек темы', e, stackTrace);
      rethrow;
    }
  }
}
