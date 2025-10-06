import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/di/injection.dart';
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
          title: Text('Избранные', style: theme.textTheme.titleLarge),
          backgroundColor: theme.colorScheme.surface,
          foregroundColor: theme.colorScheme.primary,
          elevation: 0.5,
        ),
        body: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      DropdownButton<CharacterStatus?>(
                        value: _cubit.statusFilter,
                        hint: Text("Статус"),
                        items: [
                          const DropdownMenuItem(
                            value: null,
                            child: Text("Все"),
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
                        hint: Text("Гендер"),
                        items: [
                          const DropdownMenuItem(
                            value: null,
                            child: Text("Все"),
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
                        icon: Icon(Icons.clear),
                        tooltip: "Сбросить фильтры",
                        onPressed: _cubit.resetFilters,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: state.when(
                    initial: () => Center(
                      child: Text(
                        'Нет избранных',
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
                            child: Text(
                              'Избранные пусты',
                              style: theme.textTheme.bodyLarge,
                            ),
                          )
                        : ListView.builder(
                            itemCount: favorites.length,
                            itemBuilder: (context, idx) {
                              final character = favorites[idx];
                              return CharacterCard(
                                character: character,
                                isFavorite: true,
                                onTap: () {},
                                onFavoriteToggle: () {
                                  _cubit
                                      .removeFavorite(character.id)
                                      .then((_) => _cubit.fetchFavorites());
                                },
                              );
                            },
                          ),
                    error: (error) => Center(
                      child: Text(
                        'Ошибка: $error',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.error,
                        ),
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
