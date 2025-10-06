// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rick_and_morty/core/database/database.dart' as _i199;
import 'package:rick_and_morty/core/database/database_module.dart' as _i671;
import 'package:rick_and_morty/core/network/network_module.dart' as _i450;
import 'package:rick_and_morty/core/router/app_router.dart' as _i1004;
import 'package:rick_and_morty/data/datasources/characters/characters_local_datasources.dart'
    as _i633;
import 'package:rick_and_morty/data/datasources/characters/characters_remote_datasource.dart'
    as _i405;
import 'package:rick_and_morty/data/repositories/character_repository.dart'
    as _i555;
import 'package:rick_and_morty/domain/repositories/character_repository.dart'
    as _i113;
import 'package:rick_and_morty/domain/usecases/character_usecases.dart'
    as _i892;
import 'package:rick_and_morty/ui/characters/cubit/characters_cubit.dart'
    as _i275;
import 'package:rick_and_morty/ui/favorites/cubit/favorites_cubit.dart'
    as _i853;
import 'package:rick_and_morty/ui/settings/cubit/settings_cubit.dart' as _i1033;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dBModule = _$DBModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i1033.SettingsCubit>(() => _i1033.SettingsCubit());
    gh.singleton<_i1004.AppRouter>(() => _i1004.AppRouter());
    gh.lazySingleton<_i199.AppDatabase>(() => dBModule.appDatabase());
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio());
    gh.lazySingleton<_i405.CharactersRemoteDatasource>(
      () => networkModule.charactersRemoteDatasource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i633.CharacterLocalDataSource>(
      () => _i633.CharacterLocalDataSource(gh<_i199.AppDatabase>()),
    );
    gh.lazySingleton<_i113.CharacterRepository>(
      () => _i555.CharacterRepositoryImpl(
        gh<_i405.CharactersRemoteDatasource>(),
        gh<_i633.CharacterLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i892.GetCharactersUseCase>(
      () => _i892.GetCharactersUseCase(gh<_i113.CharacterRepository>()),
    );
    gh.lazySingleton<_i892.GetCharacterUseCase>(
      () => _i892.GetCharacterUseCase(gh<_i113.CharacterRepository>()),
    );
    gh.lazySingleton<_i892.RefreshCharactersUseCase>(
      () => _i892.RefreshCharactersUseCase(gh<_i113.CharacterRepository>()),
    );
    gh.lazySingleton<_i892.ClearCacheUseCase>(
      () => _i892.ClearCacheUseCase(gh<_i113.CharacterRepository>()),
    );
    gh.lazySingleton<_i892.HasCachedDataUseCase>(
      () => _i892.HasCachedDataUseCase(gh<_i113.CharacterRepository>()),
    );
    gh.lazySingleton<_i892.AddToFavoritesUseCase>(
      () => _i892.AddToFavoritesUseCase(gh<_i113.CharacterRepository>()),
    );
    gh.lazySingleton<_i892.RemoveFromFavoritesUseCase>(
      () => _i892.RemoveFromFavoritesUseCase(gh<_i113.CharacterRepository>()),
    );
    gh.lazySingleton<_i892.GetFavoritesUseCase>(
      () => _i892.GetFavoritesUseCase(gh<_i113.CharacterRepository>()),
    );
    gh.lazySingleton<_i892.IsFavoriteUseCase>(
      () => _i892.IsFavoriteUseCase(gh<_i113.CharacterRepository>()),
    );
    gh.factory<_i853.FavoritesCubit>(
      () => _i853.FavoritesCubit(
        gh<_i892.GetFavoritesUseCase>(),
        gh<_i892.RemoveFromFavoritesUseCase>(),
      ),
    );
    gh.lazySingleton<_i275.CharactersCubit>(
      () => _i275.CharactersCubit(
        gh<_i892.GetCharactersUseCase>(),
        gh<_i892.AddToFavoritesUseCase>(),
        gh<_i892.RemoveFromFavoritesUseCase>(),
        gh<_i892.IsFavoriteUseCase>(),
      ),
    );
    return this;
  }
}

class _$DBModule extends _i671.DBModule {}

class _$NetworkModule extends _i450.NetworkModule {}
