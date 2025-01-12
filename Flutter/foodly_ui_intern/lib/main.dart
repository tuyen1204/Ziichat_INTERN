import 'package:flutter/material.dart';
import 'package:foodly_ui_intern/constants.dart';
import 'package:foodly_ui_intern/screens/home/home_screen.dart';
import 'package:foodly_ui_intern/screens/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodly UI - Intern',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        //* Settings Button Primary Color
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              //* Settings Button S
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
        ),

        //* Settings Text Body Color
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: bodyTextColor),
          titleMedium: TextStyle(color: bodyTextColor),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
