import 'package:flutter/material.dart';
import 'package:mystic_pick/screens/hover_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Image.asset('assets/name.png', width: 300),
              const SizedBox(height: 50),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [HoverBox(), SizedBox(width: 20), HoverBox()],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [HoverBox(), SizedBox(width: 20), HoverBox()],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
