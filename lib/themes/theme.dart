// themes/theme.dart
import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Colors.grey[100],
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange),
  textTheme: TextTheme(
    displayLarge: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black), // Updated from headline1
    titleMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.grey[800]), // Updated from subtitle1
    bodyLarge: const TextStyle(fontSize: 16.0, color: Colors.black), // Updated from bodyText1
    bodySmall: const TextStyle(fontSize: 12.0, color: Colors.grey), // Updated from caption
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 5,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  ),
);
