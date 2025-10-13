import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystic_pick/screens/hover.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});
  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationX;
  late Animation<double> _animationY;

  final _random = math.Random();
  bool _showSingleFace = false;
  int _selectedFace = 1;
  String _rollResult = ''; // 🧾 Text result to display

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900), // fast spin
    );

    // Multiple spins for realistic roll
    _animationX = Tween<double>(
      begin: 0,
      end: math.pi * 10,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutQuad));

    _animationY = Tween<double>(
      begin: 0,
      end: math.pi * 12,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutQuad));

    // After animation finishes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _selectedFace = _random.nextInt(6) + 1;
          _showSingleFace = true;
          _rollResult = "You rolled a $_selectedFace!"; // 🎲 Display result
        });
      }
    });
  }

  void rollDice() {
    setState(() {
      _showSingleFace = false;
      _rollResult = ''; // clear text during spin
    });
    _controller.forward(from: 0);
  }

  Widget _buildFace(String asset, Matrix4 transform) {
    return Transform(
      alignment: Alignment.center,
      transform: transform,
      child: Image.asset(asset, width: 200, height: 200, fit: BoxFit.cover),
    );
  }

  Widget _build3DCube() {
    const double size = 100; // half of dice image (for 200x200 dice)
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final rotationX = _animationX.value;
        final rotationY = _animationY.value;

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(rotationX)
            ..rotateY(rotationY),
          child: Stack(
            alignment: Alignment.center,
            children: [
              _buildFace(
                'assets/dice1.png',
                Matrix4.translationValues(0, 0, size),
              ),
              _buildFace(
                'assets/dice6.png',
                Matrix4.translationValues(0, 0, -size)..rotateY(math.pi),
              ),
              _buildFace(
                'assets/dice3.png',
                Matrix4.translationValues(size, 0, 0)..rotateY(math.pi / 2),
              ),
              _buildFace(
                'assets/dice4.png',
                Matrix4.translationValues(-size, 0, 0)..rotateY(-math.pi / 2),
              ),
              _buildFace(
                'assets/dice5.png',
                Matrix4.translationValues(0, -size, 0)..rotateX(-math.pi / 2),
              ),
              _buildFace(
                'assets/dice2.png',
                Matrix4.translationValues(0, size, 0)..rotateX(math.pi / 2),
              ),
            ],
          ),
        );
      },
    );
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
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFFead8b1),
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
              // Title
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

              const SizedBox(height: 80),

              // Dice (3D while rolling, single face when done)
              SizedBox(
                width: 200,
                height: 200,
                child: _showSingleFace
                    ? Image.asset(
                        'assets/dice$_selectedFace.png',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    : _build3DCube(),
              ),

              const SizedBox(height: 80),

              // Roll button
              Hover(
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

              const SizedBox(height: 20),

              // 🎯 Result text with stroke
              AnimatedOpacity(
                opacity: _rollResult.isNotEmpty ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Stack(
                  children: [
                    Text(
                      _rollResult,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.pressStart2p(
                        fontSize: 12,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = const Color(0xFF001f3f),
                      ),
                    ),
                    Text(
                      _rollResult,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.pressStart2p(
                        fontSize: 12,
                        color: const Color(0xFFead8b1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
