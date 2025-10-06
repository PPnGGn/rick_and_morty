import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/router/app_router.dart';
import 'package:rick_and_morty/core/di/injection.dart';
import 'package:rick_and_morty/core/utils/app_theme.dart';
import 'package:rick_and_morty/ui/settings/cubit/settings_cubit.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final router = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SettingsCubit>()..load(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (isDark) => MaterialApp.router(
              routerConfig: router.config(),
              theme: appLightTheme,
              darkTheme: appDarkTheme,
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            ),
            orElse: () => MaterialApp.router(
              routerConfig: router.config(),
              theme: appLightTheme,
              darkTheme: appDarkTheme,
              themeMode: ThemeMode.light,
            ),
          );
        },
      ),
    );
  }
}
