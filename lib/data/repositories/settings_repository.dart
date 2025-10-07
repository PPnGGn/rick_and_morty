import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/data/datasources/settings/settings_local_datasource.dart';
import 'package:rick_and_morty/domain/repositories/settings_repository.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource _localDataSource;

  SettingsRepositoryImpl(this._localDataSource);

  @override
  Future<bool> getThemeMode() => _localDataSource.getThemeMode();

  @override
  Future<void> setThemeMode(bool isDark) => _localDataSource.setThemeMode(isDark);
}
