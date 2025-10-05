import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/ui/favorites/cubit/favorites_cubit.dart';
import 'package:rick_and_morty/domain/usecases/character_usecases.dart';
import 'package:rick_and_morty/ui/widgets/character_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => FavoritesCubit(
        GetIt.instance<GetFavoritesUseCase>(),
        GetIt.instance<RemoveFromFavoritesUseCase>(),
      )..fetchFavorites(),
      child: Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: AppBar(
          title: Text('Избранные', style: theme.textTheme.titleLarge),
          backgroundColor: theme.colorScheme.background,
          foregroundColor: theme.colorScheme.primary,
          elevation: 0.5,
        ),
        body: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            final cubit = context.read<FavoritesCubit>();
            return state.when(
              initial: () => Center(child: Text('Нет избранных', style: theme.textTheme.bodyLarge)),
              loading: () => Center(child: CircularProgressIndicator(color: theme.colorScheme.primary)),
              loaded: (favorites) => favorites.isEmpty
                ? Center(child: Text('Избранные пусты', style: theme.textTheme.bodyLarge))
                : ListView.builder(
                    itemCount: favorites.length,
                    itemBuilder: (context, idx) {
                      final character = favorites[idx];
                      return CharacterCard(
                        character: character,
                        isFavorite: true,
                        onTap: () {},
                        onFavoriteToggle: () {
                          cubit.removeFavorite(character.id)
                              .then((_) => cubit.fetchFavorites());
                        },
                      );
                    },
                  ),
              error: (error) => Center(
                child: Text('Ошибка: $error', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error)),
              ),
            );
          },
        ),
      ),
    );
  }
}
