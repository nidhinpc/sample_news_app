import 'dart:ui';

import 'package:flutter/material.dart';

class ColorConstants {
  // Primary and Secondary Colors
  static const Color PrimaryColor = Color(0xFF6200EE); // Deep purple
  static const Color SecondaryColor = Color(0xFF03DAC6); // Teal

  // Text Colors
  static const Color TextColor = Colors.white; // Main text color
  static const Color SubTextColor =
      Color(0xFFB0BEC5); // Light gray for subtitles
  static const Color AccentTextColor =
      Color(0xFF4CAF50); // Green for highlights

  // Background Colors
  static const Color BackgroundColor =
      Color(0xFF121212); // Dark gray for dark mode
  static const Color CardBackgroundColor =
      Color(0xFF1E1E1E); // Slightly lighter background for cards or sections

  // Button Colors
  static const Color ButtonColor =
      Color(0xFFBB86FC); // Light purple for buttons
  static const Color ButtonTextColor = Colors.white; // Text color on buttons

  // Borders and Dividers
  static const Color BorderColor = Color(0xFF37474F); // Steel gray
  static const Color DividerColor = Color(0xFF616161); // Mid gray

  // Feedback Colors
  static const Color SuccessColor = Colors.green;
  static const Color ErrorColor = Colors.red;
  static const Color WarningColor = Color(0xFFFFC107); // Amber

  // Miscellaneous
  static const Color IconColor = Color(0xFF64B5F6); // Blue for icons
  static const Color ShadowColor = Colors.black54; // Subtle shadows for depth
  static const Color HighlightColor =
      Color(0xFFFF5722); // Orange for interactive elements

  // Gradients
  static const List<Color> GradientColors = [
    Color(0xFF6200EE),
    Color(0xFF3700B3),
  ]; // Gradient for backgrounds or special buttons
}
