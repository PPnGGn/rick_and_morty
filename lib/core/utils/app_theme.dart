import "package:flutter/material.dart";
import "package:rick_and_morty/core/utils/app_colors.dart";


const Color primary = AppColors.primary;
const Color surface = AppColors.surface;
final ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.textColor,
    ),
  ),
  scaffoldBackgroundColor: AppColors.backgroundColor,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: AppColors.blue3B82F6,
    primary: primary,
    surface: surface,
  ),

  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: "OpenSans",
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.textColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontFamily: "OpenSans",
      fontWeight: FontWeight.bold,
      color: AppColors.textColor,
    ),
  ),

  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      minimumSize: WidgetStateProperty.all(const Size.fromHeight(36)),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: 9.5),
      ),
      backgroundColor: WidgetStateProperty.all(AppColors.primary),
      foregroundColor: WidgetStateProperty.all(AppColors.surface),
      textStyle: WidgetStateProperty.all(
        const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          color: AppColors.grayFB,
        ),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  ),



  inputDecorationTheme: InputDecorationTheme(
   
    
    fillColor: AppColors.surface,

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: const BorderSide(color: Colors.white),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: BorderSide(color: AppColors.primary),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    hintStyle: const TextStyle(
      
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.onSurface,
    ),
  ),
);