import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

// Main function - entry point of the Flutter application
void main() {
  runApp(const MysticApp());
}

// Root widget of the MysticApp application
class MysticApp extends StatelessWidget {
  const MysticApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Configure and return the main MaterialApp widget
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Set the HomeScreen as the initial screen of the app
      home: const HomeScreen(),
    );
  }
}

