import 'package:flutter/material.dart';
import 'package:savings_goal_tracker/splashpage.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          // default app bar colors
          backgroundColor: Color(0xFF5263A4),
          foregroundColor: Colors.white,
        ),
      ),
      home: MySplashPage(),
    );
  }
}
