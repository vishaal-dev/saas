import 'package:flutter/material.dart';

import 'design.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    primaryColor: Colors.white,
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    listTileTheme: ListTileThemeData(tileColor: Colors.black12),
    colorScheme: ColorScheme.fromSeed(
      primary: Colors.black,
      seedColor: Colors.black,
    ),
    textTheme: TextTheme(
      headlineMedium: AppTextStyles.w50018.copyWith(color: Colors.black),
      bodyLarge: AppTextStyles.b24.copyWith(color: Colors.black),
      bodyMedium: AppTextStyles.b16.copyWith(color: Colors.black),
      bodySmall: AppTextStyles.b14.copyWith(color: Colors.black),
      labelLarge: AppTextStyles.w14.copyWith(color: Colors.black),
      labelMedium: AppTextStyles.b12.copyWith(color: Colors.black),
      labelSmall: AppTextStyles.b10.copyWith(
        color: Colors.black,
        letterSpacing: 0.0,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    primaryColor: Colors.black,
    primaryColorDark: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    canvasColor: Colors.black,
    listTileTheme: ListTileThemeData(tileColor: Colors.white10),
    colorScheme: ColorScheme.fromSeed(
      primary: Colors.white,
      seedColor: Colors.white,
    ),
    textTheme: TextTheme(
      headlineMedium: AppTextStyles.w50018.copyWith(color: Colors.white),
      bodyLarge: AppTextStyles.b24.copyWith(color: Colors.white),
      bodyMedium: AppTextStyles.b16.copyWith(color: Colors.white),
      bodySmall: AppTextStyles.b14.copyWith(color: Colors.white),
      labelLarge: AppTextStyles.w14.copyWith(color: Colors.white),
      labelMedium: AppTextStyles.b12.copyWith(color: Colors.white),
      labelSmall: AppTextStyles.b10.copyWith(
        color: Colors.white,
        letterSpacing: 0.0,
      ),
    ),
  );
}
