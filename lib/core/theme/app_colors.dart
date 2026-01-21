import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Colors
  static const Color primaryBlue = Color(0xFF0096FC); // Main action color
  static const Color secondaryCyan = Color(0xFF00D1FF); // Gradient accents

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryBlue, secondaryCyan],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient weatherGradient = LinearGradient(
    colors: [
      Color(0xFF6A85B6),
      Color(0xFFBAC8E0),
    ], // Placeholder for purple/blue weather card
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Background Surfaces
  static const Color background = Color(0xFFF5F7FA); // Light grey background
  static const Color surface = Colors.white;

  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textInverse = Colors.white;

  // Status/Functional Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFA726);
  static const Color error = Color(0xFFE53935);

  // Specific UI Elements
  static const Color inputBorder = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFEEEEEE);
}
