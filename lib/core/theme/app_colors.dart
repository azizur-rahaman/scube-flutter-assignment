import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Colors
  static const Color primaryBlue = Color(0xFF0096FC); // Main action color
  static const Color secondaryCyan = Color(0xFF00C0E8); // Gradient accents

  // Scrollbar Colors
  static const Color scrollbarLight = Color(0xFF4E91FD);
  static const Color scrollbarDark = Color(0xFF080B7F);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryBlue, secondaryCyan],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient weatherGradient = LinearGradient(
    colors: [
      Color(0xFF5B7FFF), // Lighter Blue/Purple
      Color(0xFFA678D6), // Purple/Pinkish
    ], // Placeholder for purple/blue weather card
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient scrollbarGradient = LinearGradient(
    colors: [scrollbarLight, scrollbarDark],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Background Surfaces
  static const Color background = Color(0xFFF5F7FA); // Light grey background
  static const Color lightBlueBg = Color(
    0xFFE8F1F8,
  ); // Light bluish gray background
  static const Color surface = Colors.white;
  static const Color tableRowHighlight = Color(0xFFEEF3F9);

  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textInverse = Colors.white;
  static const Color textDarkBlue = Color(0xFF001F3F);

  // Status/Functional Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFA726);
  static const Color error = Color(0xFFE53935);
  static const Color notificationRed = Colors.red;

  // Status Colors
  static const Color infoBg = Color(0xFFE1F5FE); // lightBlue.shade50
  static const Color warningBg = Color(0xFFFFF8E1); // amber.shade50
  static const Color errorBg = Color(0xFFFFF3E0); // orange.shade50
  static const Color successBg = Color(0xFFF3E5F5); // purple.shade50

  // Specific UI Elements
  static const Color inputBorder = Color(0xFF9AA9BC);
  static const Color divider = Color(0xFFEEEEEE);
}
