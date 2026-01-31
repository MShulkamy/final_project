import 'package:flutter/material.dart';

class AppColors {
  // Primary Color
  static const Color primary = Color(0xFF8E6CEF);
  
  // Background Colors
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color darkBackground = Color(0xFF000000);
  
  // Text Colors
  static const Color lightText = Color(0xFF000000);
  static const Color darkText = Color(0xFFFFFFFF);
  static const Color greyText = Color(0xFF757575);
  
  // Surface Colors
  static const Color lightSurface = Color(0xFFF5F5F5);
  static const Color darkSurface = Color(0xFF1A1A1A);
  
  // Border Colors
  static const Color lightBorder = Color(0xFFE0E0E0);
  static const Color darkBorder = Color(0xFF2A2A2A);
  
  // Accent Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFA726);
  
  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF8E6CEF), Color(0xFFB794F6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
