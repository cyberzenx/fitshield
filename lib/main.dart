// main.dart
import 'package:flutter/material.dart';
import 'screens/food_menu_screen.dart';
import 'themes/theme.dart';

void main() {
  runApp(FitShieldApp());
}

class FitShieldApp extends StatelessWidget {
  const FitShieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitShield',
      theme: appTheme,
      home: FoodMenuScreen(),
    );
  }
}