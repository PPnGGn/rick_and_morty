/// Константы приложения
class AppConstants {
  AppConstants._(); // Приватный конструктор для запрета создания экземпляров

  /// Размер страницы для пагинации
  static const int pageSize = 20;

  /// Порог для начала загрузки следующей страницы (пиксели от конца списка)
  static const double loadMoreThreshold = 300.0;
}

/// Ключи для SharedPreferences
class PrefsKeys {
  PrefsKeys._();

  /// Ключ для хранения темы приложения
  static const String themeMode = 'app_theme_mode';
}

/// Значения для настроек темы
class ThemeValues {
  ThemeValues._();

  static const String dark = 'dark';
  static const String light = 'light';
}

/// Строки приложения
class AppStrings {
  AppStrings._();

  // Общие
  static const String loading = 'Загрузка...';
  static const String error = 'Ошибка';
  static const String retry = 'Повторить';
  static const String cancel = 'Отмена';
  static const String ok = 'OK';

  // Персонажи
  static const String characters = 'Персонажи';
  static const String characterStatus = 'Статус';
  static const String characterSpecies = 'Вид';
  static const String characterGender = 'Пол';
  static const String characterOrigin = 'Происхождение';
  static const String characterLocation = 'Локация';

  // Избранное
  static const String favorites = 'Избранное';
  static const String favoritesEmpty = 'Избранные пусты';
  static const String favoritesEmptyHint =
      'Добавьте персонажей в избранное, нажав на звезду';
  static const String addToFavorites = 'Добавить в избранное';
  static const String removeFromFavorites = 'Удалить из избранного';
  static const String allStatuses = 'Все статусы';
  static const String allGenders = 'Все';
  static const String resetFilters = 'Сбросить фильтры';

  // Настройки
  static const String settings = 'Настройки';
  static const String appearance = 'Внешний вид';
  static const String darkTheme = 'Тёмная тема';
  static const String darkThemeEnabled = 'Включена тёмная тема';
  static const String lightThemeEnabled = 'Включена светлая тема';
  static const String about = 'О приложении';
  static const String version = 'Версия';
  static const String api = 'API';

  // Ошибки
  static const String networkError =
      'Ошибка сети. Проверьте подключение к интернету';
  static const String serverError = 'Ошибка сервера. Попробуйте позже';
  static const String cacheError = 'Ошибка локального хранилища';
  static const String unknownError = 'Неизвестная ошибка';
  static const String noDataError = 'Нет данных для отображения';
  static const String noInternetAndCache = 'Нет интернета и кеш пуст';
}
