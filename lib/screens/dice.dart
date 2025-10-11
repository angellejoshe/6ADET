import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:mystic_pick/screens/cube.dart';
import 'package:mystic_pick/screens/hover.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationX;
  late Animation<double> _rotationY;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _rotationX = Tween<double>(begin: 0, end: 0).animate(_controller);
    _rotationY = Tween<double>(begin: 0, end: 0).animate(_controller);
  }

  void rollDice() {
    final random = math.Random();

    // Random rotations in both directions
    final newX = _rotationX.value + (random.nextDouble() * 4 * math.pi);
    final newY = _rotationY.value + (random.nextDouble() * 4 * math.pi);

    setState(() {
      _rotationX = Tween<double>(
        begin: _rotationX.value,
        end: newX,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
      _rotationY = Tween<double>(
        begin: _rotationY.value,
        end: newY,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    });

    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFead8b1)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mysticspherebg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Text(
                    'ROLL THE DICE',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pressStart2p(
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 7
                        ..color = const Color(0xFF001f3f),
                    ),
                  ),
                  Text(
                    'ROLL THE DICE',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pressStart2p(
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                      color: const Color(0xFFead8b1),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              // 🧊 Animated cube
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Cube(
                    rotationX: _rotationX.value,
                    rotationY: _rotationY.value,
                  );
                },
              ),

              const SizedBox(height: 40),

              Hover(
                child: GestureDetector(
                  onTap: rollDice,
                  child: Stack(
                    children: [
                      Text(
                        "ROLL",
                        style: GoogleFonts.pressStart2p(
                          fontSize: 13,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 4
                            ..color = const Color(0xFF001f3f),
                        ),
                      ),
                      Text(
                        "ROLL",
                        style: GoogleFonts.pressStart2p(
                          fontSize: 13,
                          color: const Color(0xFFead8b1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
