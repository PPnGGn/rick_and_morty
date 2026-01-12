import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/di/injection.dart';
import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/domain/enums/enums.dart';
import 'package:rick_and_morty/ui/favorites/cubit/favorites_cubit.dart';
import 'package:rick_and_morty/ui/widgets/character_card.dart';

@RoutePage()
class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>
    with AutoRouteAwareStateMixin<FavoritesPage> {
  late final FavoritesCubit _cubit;
  TabsRouter? _tabsRouter;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<FavoritesCubit>()..fetchFavorites();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabsRouter ??= AutoTabsRouter.of(context);
    _tabsRouter?.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_tabsRouter?.activeIndex == 1) {
      _cubit.fetchFavorites();
    }
  }

  void _showRemovedFromFavoritesSnackBar(String characterName) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$characterName удален из избранного')),
    );
  }

  Future<bool?> _showDeleteConfirmationDialog() async {
    if (!mounted) return null;

    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        final theme = Theme.of(context);
        return AlertDialog(
          title: const Text('Удалить из избранного?'),
          content: const Text(
            'Вы уверены, что хотите удалить этого персонажа из избранного?',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: TextButton.styleFrom(
                foregroundColor: theme.colorScheme.error,
              ),
              child: const Text('Удалить'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _tabsRouter?.removeListener(_onTabChanged);
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(
          title: Text(AppStrings.favorites, style: theme.textTheme.titleLarge),
          backgroundColor: theme.colorScheme.surface,
          foregroundColor: theme.colorScheme.primary,
          elevation: 0.5,
        ),
        body: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    children: [
                      DropdownButton<CharacterStatus?>(
                        value: _cubit.statusFilter,
                        hint: Text(AppStrings.characterStatus),
                        items: [
                          DropdownMenuItem(
                            value: null,
                            child: Text(AppStrings.allStatuses),
                          ),
                          ...CharacterStatus.values.map(
                            (status) => DropdownMenuItem(
                              value: status,
                              child: Text(status.value),
                            ),
                          ),
                        ],
                        onChanged: (value) => _cubit.setStatusFilter(value),
                      ),
                      const SizedBox(width: 16),
                      DropdownButton<CharacterGender?>(
                        value: _cubit.genderFilter,
                        hint: Text(AppStrings.characterGender),
                        items: [
                          DropdownMenuItem(
                            value: null,
                            child: Text(AppStrings.allGenders),
                          ),
                          ...CharacterGender.values.map(
                            (gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(gender.value),
                            ),
                          ),
                        ],
                        onChanged: (value) => _cubit.setGenderFilter(value),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.clear),
                        tooltip: AppStrings.resetFilters,
                        onPressed: _cubit.resetFilters,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: state.when(
                    initial: () => Center(
                      child: Text(
                        AppStrings.favoritesEmpty,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    loading: () => Center(
                      child: CircularProgressIndicator(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    loaded: (favorites) => favorites.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star_border,
                                  size: 64,
                                  color: theme.colorScheme.onSurface
                                      .withOpacity(0.3),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  AppStrings.favoritesEmpty,
                                  style: theme.textTheme.titleMedium,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  AppStrings.favoritesEmptyHint,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withOpacity(0.6),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: favorites.length,
                            itemBuilder: (context, idx) {
                              final character = favorites[idx];
                              return Dismissible(
                                key: Key('dismissible_${character.id}'),
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 20.0),
                                  color: theme.colorScheme.error,
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                                confirmDismiss: (_) =>
                                    _showDeleteConfirmationDialog(),
                                onDismissed: (direction) async {
                                  await _cubit.removeFavorite(character.id);
                                  _showRemovedFromFavoritesSnackBar(
                                    character.name,
                                  );
                                },
                                child: CharacterCard(
                                  character: character,
                                  isFavorite: true,
                                  onTap: () {},
                                  onFavoriteToggle: () async {
                                    if (await _showDeleteConfirmationDialog() ==
                                        true) {
                                      await _cubit.removeFavorite(character.id);
                                      _showRemovedFromFavoritesSnackBar(
                                        character.name,
                                      );
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                    error: (error) => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 64,
                            color: theme.colorScheme.error,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '${AppStrings.error}: $error',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.error,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: () => _cubit.fetchFavorites(),
                            icon: const Icon(Icons.refresh),
                            label: Text(AppStrings.retry),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              foregroundColor: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
