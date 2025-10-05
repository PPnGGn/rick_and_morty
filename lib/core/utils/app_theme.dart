import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';

final ThemeData appLightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.background,
    foregroundColor: AppColors.text,
    surfaceTintColor: Colors.transparent,
    elevation: 1,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.text,
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
    foregroundColor: AppColors.card,
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
