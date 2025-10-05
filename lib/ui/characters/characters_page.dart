import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/ui/characters/cubit/characters_cubit.dart';
import 'package:rick_and_morty/ui/widgets/character_card.dart';

@RoutePage()
class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => GetIt.instance<CharactersCubit>()..fetchCharacters(),
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(
          title: Text('Rick & Morty', style: theme.textTheme.titleLarge),
          backgroundColor: theme.colorScheme.surface,
          foregroundColor: theme.colorScheme.primary,
          elevation: 0.5,
        ),
        body: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            final cubit = context.read<CharactersCubit>();
            return state.when(
              initial: () => Center(
                child: Text('Загрузка...', style: theme.textTheme.bodyLarge),
              ),
              loading: () => Center(
                child: CircularProgressIndicator(
                  color: theme.colorScheme.primary,
                ),
              ),
              loaded: (characters) => ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  final character = characters[index];
                  // Асинхронно узнаём isFavorite
                  final isFavorite =
                      cubit.isFavoriteSync(character.id) ?? false;
                  return CharacterCard(
                    character: character,
                    isFavorite: isFavorite,
                    onTap: () {},
                    onFavoriteToggle: () {
                      cubit.toggleFavorite(character);
                    },
                  );
                },
              ),
              error: (error) => Center(
                child: Text(
                  'Ошибка: $error',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.error,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
