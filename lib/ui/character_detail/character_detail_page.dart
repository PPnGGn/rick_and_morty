import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/di/injection.dart';
import 'package:rick_and_morty/ui/character_detail/cubit/character_detail_cubit.dart';

@RoutePage()
class CharacterDetailPage extends StatelessWidget {
  final int id;

  const CharacterDetailPage({super.key, @PathParam('id') required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CharacterDetailCubit>()..loadCharacterById(id),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<CharacterDetailCubit, CharacterDetailState>(
            builder: (context, state) {
              return state.maybeWhen(
                characterLoaded: (character) => Text(character.name),
                loadingDescription: (character) => Text(character.name),
                streaming: (character, _) => Text(character.name),
                loaded: (character, _) => Text(character.name),
                orElse: () => const Text('Загрузка...'),
              );
            },
          ),
        ),
        body: BlocBuilder<CharacterDetailCubit, CharacterDetailState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),

              loadingCharacter: () =>
                  const Center(child: CircularProgressIndicator()),

              characterLoaded: (character) =>
                  _buildContent(context, character, isLoading: true),

              loadingDescription: (character) =>
                  _buildContent(context, character, isLoading: true),

              streaming: (character, partialText) => _buildContent(
                context,
                character,
                text: partialText,
                isStreaming: true,
              ),

              loaded: (character, fullText) => _buildContent(
                context,
                character,
                text: fullText,
                isLoaded: true,
              ),

              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    Text('Ошибка: $message', textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<CharacterDetailCubit>().loadCharacterById(
                          id,
                        );
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Повторить'),
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

  Widget _buildContent(
    BuildContext context,
    dynamic character, {
    String? text,
    bool isLoading = false,
    bool isStreaming = false,
    bool isLoaded = false,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Hero(
              tag: 'character_${character.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  character.image,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 200,
                      height: 200,
                      color: Colors.grey[300],
                      child: const Icon(Icons.person, size: 80),
                    );
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'Описание',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          if (isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: CircularProgressIndicator(),
              ),
            )
          else if (text != null && text.isNotEmpty) ...[
            Text(text, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 16),

            // Индикаторы состояния
            if (isStreaming)
              const Row(
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  SizedBox(width: 8),
                  Text('Генерируется...'),
                ],
              )
            else if (isLoaded)
              const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 8),
                  Text('Готово'),
                ],
              ),
          ] else if (!isLoading)
            const Text('Нет описания'),
        ],
      ),
    );
  }
}
