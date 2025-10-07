import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/di/injection.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/ui/characters/cubit/characters_cubit.dart';
import 'package:rick_and_morty/ui/widgets/character_card.dart';

@RoutePage()
class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late final ScrollController _scrollController;
  late final CharactersCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<CharactersCubit>()..fetchCharacters();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - AppConstants.loadMoreThreshold) {
      _cubit.loadMoreCharacters();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
          title: Text(AppStrings.appName, style: theme.textTheme.titleLarge),
          backgroundColor: theme.colorScheme.surface,
          foregroundColor: theme.colorScheme.primary,
          elevation: 0.5,
        ),
        body: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            return state.when(
              initial: () => Center(
                child: Text(AppStrings.loading, style: theme.textTheme.bodyLarge),
              ),
              loading: () => Center(
                child: CircularProgressIndicator(
                  color: theme.colorScheme.primary,
                ),
              ),
              loaded: (characters, favoritesCache) => RefreshIndicator(
                color: AppColors.primary,
                onRefresh: () => _cubit.refreshCharacters(),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: characters.length + 1,
                  itemBuilder: (context, index) {
                    if (index < characters.length) {
                      final character = characters[index];
                      final isFavorite = favoritesCache[character.id] ?? false;
                      return CharacterCard(
                        character: character,
                        isFavorite: isFavorite,
                        onTap: () {},
                        onFavoriteToggle: () {
                          _cubit.toggleFavorite(character);
                        },
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                ),
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
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.error,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => _cubit.fetchCharacters(refresh: true),
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
            );
          },
        ),
      ),
    );
  }
}
