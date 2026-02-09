import 'package:flutter/material.dart';

import 'design.dart';

class AppTheme {
  static const _poppins = 'Poppins';

  static TextTheme _lightTextTheme() {
    return TextTheme(
      headlineMedium: AppTextStyles.w50018.copyWith(
        color: Colors.black,
        fontFamily: _poppins,
      ),
      bodyLarge: AppTextStyles.b24.copyWith(
        color: const Color(0xFFFFFFFF),
        fontFamily: _poppins,
      ),
      bodyMedium: AppTextStyles.b16.copyWith(
        color: const Color(0xFFFFFFFF),
        fontFamily: _poppins,
      ),
      bodySmall: AppTextStyles.b14.copyWith(
        color: Colors.black,
        fontFamily: _poppins,
      ),
      labelLarge: AppTextStyles.w14.copyWith(
        color: Colors.black,
        fontFamily: _poppins,
      ),
      labelMedium: AppTextStyles.b12.copyWith(
        color: Colors.black,
        fontFamily: _poppins,
      ),
      labelSmall: AppTextStyles.b10.copyWith(
        color: Colors.black,
        letterSpacing: 0.0,
        fontFamily: _poppins,
      ),
    );
  }

  static TextTheme _darkTextTheme() {
    return TextTheme(
      headlineMedium: AppTextStyles.w50018.copyWith(
        color: Colors.white,
        fontFamily: _poppins,
      ),
      bodyLarge: AppTextStyles.b24.copyWith(
        color: Colors.white,
        fontFamily: _poppins,
      ),
      bodyMedium: AppTextStyles.b16.copyWith(
        color: Colors.white,
        fontFamily: _poppins,
      ),
      bodySmall: AppTextStyles.b14.copyWith(
        color: Colors.white,
        fontFamily: _poppins,
      ),
      labelLarge: AppTextStyles.w14.copyWith(
        color: Colors.white,
        fontFamily: _poppins,
      ),
      labelMedium: AppTextStyles.b12.copyWith(
        color: Colors.white,
        fontFamily: _poppins,
      ),
      labelSmall: AppTextStyles.b10.copyWith(
        color: Colors.white,
        letterSpacing: 0.0,
        fontFamily: _poppins,
      ),
    );
  }

  static final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: _poppins,
    primaryColor: Colors.white,
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    listTileTheme: ListTileThemeData(tileColor: Colors.black12),
    colorScheme: ColorScheme.fromSeed(
      primary: Colors.black,
      seedColor: Colors.black,
    ),
    textTheme: Typography.material2021().black
        .apply(fontFamily: _poppins)
        .merge(_lightTextTheme()),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: _poppins,
    primaryColor: Colors.black,
    primaryColorDark: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    canvasColor: Colors.black,
    listTileTheme: ListTileThemeData(tileColor: Colors.white10),
    colorScheme: ColorScheme.fromSeed(
      primary: Colors.white,
      seedColor: Colors.white,
    ),
    textTheme: Typography.material2021().white
        .apply(fontFamily: _poppins)
        .merge(_darkTextTheme()),
  );
}
