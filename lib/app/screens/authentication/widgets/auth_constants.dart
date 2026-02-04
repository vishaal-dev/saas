import 'package:flutter/material.dart';

/// Shared design constants for authentication screens.
abstract final class AuthConstants {
  AuthConstants._();

  // Colors
  static const Color cardBackground = Color(0xFFF8FAFC);
  static const Color titleColor = Color(0xFF4F46E5);
  static const Color labelColor = Color(0xFF0F172A);
  static const Color hintColor = Color(0xFF94A3B8);
  static const Color textColor = Color(0xFF0F172A);
  static const Color supportTextColor = Color(0xFF475569);
  static const Color borderColor = Color(0xFFE2E8F0);
  static const Color focusedBorderColor = Color(0xFF6C63FF);
  static const Color buttonEnabledColor = Color(0xFF4F46E5);
  static const Color buttonDisabledColor = Color(0xFFA5B4FC);
  static const Color fieldFillColor = Color(0xFFFFFFFF);

  // Gradient
  static const Color gradientStart = Color(0xFF0F172A);
  static const Color gradientEnd = Color(0xFF334F90);
  static const double overlayOpacity = 0.80;

  // Dimensions
  static const double logoHeight = 48;
  static const double fieldHeight = 44;
  static const double buttonHeight = 44;
  static const double cardBorderRadius = 12;
  static const double cardMinWidth = 495;
  static const double cardMinHeight = 671;
  static const double fieldBorderRadius = 10;

  // Spacing (from login reference)
  static const double spacingAfterLogo = 48;
  static const double spacingAfterTitle = 48;
  static const double spacingAfterLabel = 16;
  static const double spacingBetweenFields = 32;
  static const double spacingAfterButton = 80;
  static const double cardPaddingVertical = 48;
  static const double cardPaddingHorizontal = 108;
}
