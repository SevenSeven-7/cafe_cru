import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const CobaCafeApp());
}

class CobaCafeApp extends StatelessWidget {
  const CobaCafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coba Cafe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF8D6E63),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF5D4037),
          secondary: const Color(0xFFFFB300),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF3E2723)),
          bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF4E342E)),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}