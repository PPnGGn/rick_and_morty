// Репозиторий для управления настройками приложения
abstract class SettingsRepository {
  // Загрузить настройки темы
  Future<bool> getThemeMode();

  // Сохранить настройки темы
  Future<void> setThemeMode(bool isDark);
}
