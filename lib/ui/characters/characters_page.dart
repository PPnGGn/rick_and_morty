import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
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
  late CharactersCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = GetIt.instance<CharactersCubit>()..fetchCharacters();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Проверяем, если скролл приблизился к концу
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      cubit.loadMoreCharacters();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider.value(
      value: cubit,
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
            return state.when(
              initial: () => Center(
                child: Text('Загрузка...', style: theme.textTheme.bodyLarge),
              ),
              loading: () => Center(
                child: CircularProgressIndicator(
                  color: theme.colorScheme.primary,
                ),
              ),
              loaded: (characters) => RefreshIndicator(
                color: AppColors.primary,
                onRefresh: () => cubit.refreshCharacters(),
                child: ListView.builder(
                  controller: _scrollController,
                 // physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: characters.length + 1, // +1 для лоадера внизу
                  itemBuilder: (context, index) {
                    if (index < characters.length) {
                      final character = characters[index];
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
                    } else {
                      // Нижний лоадер для дозагрузки
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      );
                    }
                  },
                ),
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
