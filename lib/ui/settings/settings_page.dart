import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/ui/settings/cubit/settings_cubit.dart';
import 'package:rick_and_morty/core/constants/app_constants.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(AppStrings.settings, style: theme.textTheme.titleLarge),
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
                  AppStrings.appearance,
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
                      AppStrings.darkTheme,
                      style: theme.textTheme.bodyLarge,
                    ),
                    subtitle: Text(
                      isDark
                          ? AppStrings.darkThemeEnabled
                          : AppStrings.lightThemeEnabled,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                      ),
                    ),
                    value: isDark,
                    onChanged: (value) {
                      context.read<SettingsCubit>().changeTheme(value);
                    },
                    activeThumbColor: theme.colorScheme.primary,
                    secondary: Icon(
                      isDark ? Icons.dark_mode : Icons.light_mode,
                      color: theme.colorScheme.primary,
                    ),
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
