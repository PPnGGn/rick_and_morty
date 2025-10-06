import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';

final ThemeData appLightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.background,
    foregroundColor: AppColors.primary,
    elevation: 1,
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    ),
    iconTheme: IconThemeData(color: AppColors.primary),
  ),
  colorScheme: ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.accent,
    surface: AppColors.surface,
    onPrimary: AppColors.surface,
    onSecondary: AppColors.text,
    onSurface: AppColors.text,
    background: AppColors.background,
  ),
  cardTheme: const CardThemeData(
    color: AppColors.card,
    elevation: 3,
    shadowColor: AppColors.divider,
    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.surface,
  ),
  dividerColor: AppColors.divider,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.text,
      fontSize: 14,
      fontFamily: "OpenSans",
    ),
    bodyLarge: TextStyle(
      color: AppColors.text,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: "OpenSans",
    ),
    titleLarge: TextStyle(
      color: AppColors.primary,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  ),
  listTileTheme: const ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    iconColor: AppColors.primary,
    tileColor: AppColors.card,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    textColor: AppColors.text,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.background,
    elevation: 10,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.textSecondary,
    selectedIconTheme: IconThemeData(color: AppColors.primary),
    unselectedIconTheme: IconThemeData(color: AppColors.textSecondary),
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.surface,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: AppColors.primary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: AppColors.divider),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: AppColors.primary),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    hintStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.textSecondary,
      fontFamily: "OpenSans",
    ),
  ),
);

final ThemeData appDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: const Color(0xFF181D23),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF181D23),
    foregroundColor: AppColors.yellow,
    elevation: 1,
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.yellow,
    ),
    iconTheme: IconThemeData(color: AppColors.primary),
  ),
  colorScheme: ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.accent,
    surface: const Color(0xFF222A36),
    onPrimary: AppColors.surface,
    onSecondary: Color(0xFFF9FAFB),
    onSurface: AppColors.yellow,
    background: Color(0xFF181D23),
  ),
  cardTheme: const CardThemeData(
    color: Color(0xFF222A36),
    elevation: 3,
    shadowColor: Color(0xFF11151A),
    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: Color(0xFF222A36),
  ),
  dividerColor: Color(0xFF374151),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.yellow,
      fontSize: 14,
      fontFamily: "OpenSans",
    ),
    bodyLarge: TextStyle(
      color: AppColors.yellow,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: "OpenSans",
    ),
    titleLarge: TextStyle(
      color: AppColors.primary,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  ),
  listTileTheme: const ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    iconColor: AppColors.primary,
    tileColor: Color(0xFF222A36),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    textColor: AppColors.yellow,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF181D23),
    elevation: 10,
    selectedItemColor: AppColors.yellow,
    unselectedItemColor: AppColors.accent,
    selectedIconTheme: IconThemeData(color: AppColors.yellow),
    unselectedIconTheme: IconThemeData(color: AppColors.accent),
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Color(0xFF222A36),
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: AppColors.primary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: Color(0xFF374151)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: AppColors.primary),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    hintStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.accent,
      fontFamily: "OpenSans",
    ),
  ),
);
