// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:rick_and_morty/core/route_wrappers/characters.dart' as _i3;
import 'package:rick_and_morty/core/route_wrappers/favorites.dart' as _i5;
import 'package:rick_and_morty/core/route_wrappers/home.dart' as _i6;
import 'package:rick_and_morty/core/route_wrappers/settings.dart' as _i8;
import 'package:rick_and_morty/ui/character_detail/character_detail_page.dart'
    as _i1;
import 'package:rick_and_morty/ui/characters/characters_page.dart' as _i2;
import 'package:rick_and_morty/ui/favorites/favorites_page.dart' as _i4;
import 'package:rick_and_morty/ui/settings/settings_page.dart' as _i7;

/// generated route for
/// [_i1.CharacterDetailPage]
class CharacterDetailRoute extends _i9.PageRouteInfo<CharacterDetailRouteArgs> {
  CharacterDetailRoute({
    _i10.Key? key,
    required int id,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         CharacterDetailRoute.name,
         args: CharacterDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'CharacterDetailRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<CharacterDetailRouteArgs>(
        orElse: () => CharacterDetailRouteArgs(id: pathParams.getInt('id')),
      );
      return _i1.CharacterDetailPage(key: args.key, id: args.id);
    },
  );
}

class CharacterDetailRouteArgs {
  const CharacterDetailRouteArgs({this.key, required this.id});

  final _i10.Key? key;

  final int id;

  @override
  String toString() {
    return 'CharacterDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CharacterDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i2.CharactersPage]
class CharactersRoute extends _i9.PageRouteInfo<void> {
  const CharactersRoute({List<_i9.PageRouteInfo>? children})
    : super(CharactersRoute.name, initialChildren: children);

  static const String name = 'CharactersRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.CharactersPage();
    },
  );
}

/// generated route for
/// [_i3.CharactersWrapperPage]
class CharactersWrapperRoute extends _i9.PageRouteInfo<void> {
  const CharactersWrapperRoute({List<_i9.PageRouteInfo>? children})
    : super(CharactersWrapperRoute.name, initialChildren: children);

  static const String name = 'CharactersWrapperRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.CharactersWrapperPage();
    },
  );
}

/// generated route for
/// [_i4.FavoritesPage]
class FavoritesRoute extends _i9.PageRouteInfo<void> {
  const FavoritesRoute({List<_i9.PageRouteInfo>? children})
    : super(FavoritesRoute.name, initialChildren: children);

  static const String name = 'FavoritesRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.FavoritesPage();
    },
  );
}

/// generated route for
/// [_i5.FavoritesWrapperPage]
class FavoritesWrapperRoute extends _i9.PageRouteInfo<void> {
  const FavoritesWrapperRoute({List<_i9.PageRouteInfo>? children})
    : super(FavoritesWrapperRoute.name, initialChildren: children);

  static const String name = 'FavoritesWrapperRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.FavoritesWrapperPage();
    },
  );
}

/// generated route for
/// [_i6.HomeWrapperPage]
class HomeWrapperRoute extends _i9.PageRouteInfo<void> {
  const HomeWrapperRoute({List<_i9.PageRouteInfo>? children})
    : super(HomeWrapperRoute.name, initialChildren: children);

  static const String name = 'HomeWrapperRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomeWrapperPage();
    },
  );
}

/// generated route for
/// [_i7.SettingsPage]
class SettingsRoute extends _i9.PageRouteInfo<void> {
  const SettingsRoute({List<_i9.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.SettingsPage();
    },
  );
}

/// generated route for
/// [_i8.SettingsWrapperPage]
class SettingsWrapperRoute extends _i9.PageRouteInfo<void> {
  const SettingsWrapperRoute({List<_i9.PageRouteInfo>? children})
    : super(SettingsWrapperRoute.name, initialChildren: children);

  static const String name = 'SettingsWrapperRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.SettingsWrapperPage();
    },
  );
}
