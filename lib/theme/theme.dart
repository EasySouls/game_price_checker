import 'package:flutter/material.dart';

class FlutterGamePricesTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(color: Colors.blue),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF13B9FF),
        primary: Colors.tealAccent,
        secondary: Colors.white,
        surface: Colors.grey[900],
      ),
      snackBarTheme:
          const SnackBarThemeData(behavior: SnackBarBehavior.floating),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 16, 46, 59),
      ),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color(0xFF13B9FF),
        primary: Colors.tealAccent,
        secondary: Colors.white,
        surface: Colors.grey[900],
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
