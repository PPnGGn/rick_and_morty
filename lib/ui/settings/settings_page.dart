import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/ui/settings/cubit/settings_cubit.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text('Настройки', style: theme.textTheme.titleLarge),
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.primary,
        elevation: 0.5,
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loaded: (isDark) => ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Секция "Внешний вид"
                Text(
                  'Внешний вид',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                // Карточка с переключателем темы
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SwitchListTile(
                    title: Text(
                      'Тёмная тема',
                      style: theme.textTheme.bodyLarge,
                    ),
                    subtitle: Text(
                      isDark ? 'Включена тёмная тема' : 'Включена светлая тема',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                    value: isDark,
                    onChanged: (value) {
                      context.read<SettingsCubit>().changeTheme(value);
                    },
                    activeColor: theme.colorScheme.primary,
                    secondary: Icon(
                      isDark ? Icons.dark_mode : Icons.light_mode,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Секция "О приложении"
                Text(
                  'О приложении',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.info_outline,
                          color: theme.colorScheme.primary,
                        ),
                        title: Text('Версия', style: theme.textTheme.bodyLarge),
                        subtitle: Text(
                          '1.0.0',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: theme.colorScheme.onSurface.withOpacity(0.1),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.code,
                          color: theme.colorScheme.primary,
                        ),
                        title: Text('API', style: theme.textTheme.bodyLarge),
                        subtitle: Text(
                          'Rick and Morty API',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
