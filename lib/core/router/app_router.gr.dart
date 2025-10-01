// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:rick_and_morty/core/route_wrappers/characters.dart' as _i2;
import 'package:rick_and_morty/core/route_wrappers/favorites.dart' as _i4;
import 'package:rick_and_morty/core/route_wrappers/home.dart' as _i5;
import 'package:rick_and_morty/core/route_wrappers/settings.dart' as _i7;
import 'package:rick_and_morty/presentation/pages/characters/characters_page.dart'
    as _i1;
import 'package:rick_and_morty/presentation/pages/favorites/favorites_page.dart'
    as _i3;
import 'package:rick_and_morty/presentation/pages/settings/settings_page.dart'
    as _i6;

/// generated route for
/// [_i1.CharactersPage]
class CharactersRoute extends _i8.PageRouteInfo<void> {
  const CharactersRoute({List<_i8.PageRouteInfo>? children})
    : super(CharactersRoute.name, initialChildren: children);

  static const String name = 'CharactersRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.CharactersPage();
    },
  );
}

/// generated route for
/// [_i2.CharactersWrapperPage]
class CharactersWrapperRoute extends _i8.PageRouteInfo<void> {
  const CharactersWrapperRoute({List<_i8.PageRouteInfo>? children})
    : super(CharactersWrapperRoute.name, initialChildren: children);

  static const String name = 'CharactersWrapperRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.CharactersWrapperPage();
    },
  );
}

/// generated route for
/// [_i3.FavoritesPage]
class FavoritesRoute extends _i8.PageRouteInfo<void> {
  const FavoritesRoute({List<_i8.PageRouteInfo>? children})
    : super(FavoritesRoute.name, initialChildren: children);

  static const String name = 'FavoritesRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.FavoritesPage();
    },
  );
}

/// generated route for
/// [_i4.FavoritesWrapperPage]
class FavoritesWrapperRoute extends _i8.PageRouteInfo<void> {
  const FavoritesWrapperRoute({List<_i8.PageRouteInfo>? children})
    : super(FavoritesWrapperRoute.name, initialChildren: children);

  static const String name = 'FavoritesWrapperRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.FavoritesWrapperPage();
    },
  );
}

/// generated route for
/// [_i5.HomeWrapperPage]
class HomeWrapperRoute extends _i8.PageRouteInfo<void> {
  const HomeWrapperRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeWrapperRoute.name, initialChildren: children);

  static const String name = 'HomeWrapperRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeWrapperPage();
    },
  );
}

/// generated route for
/// [_i6.SettingsPage]
class SettingsRoute extends _i8.PageRouteInfo<void> {
  const SettingsRoute({List<_i8.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.SettingsPage();
    },
  );
}

/// generated route for
/// [_i7.SettingsWrapperPage]
class SettingsWrapperRoute extends _i8.PageRouteInfo<void> {
  const SettingsWrapperRoute({List<_i8.PageRouteInfo>? children})
    : super(SettingsWrapperRoute.name, initialChildren: children);

  static const String name = 'SettingsWrapperRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.SettingsWrapperPage();
    },
  );
}
