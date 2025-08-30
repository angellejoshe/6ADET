import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MysticApp());
}

class MysticApp extends StatelessWidget {
  const MysticApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
