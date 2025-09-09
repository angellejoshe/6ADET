import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class MysticSphere extends StatefulWidget {
  const MysticSphere({super.key});

  @override
  State<MysticSphere> createState() => _MysticSphereState();
}

class _MysticSphereState extends State<MysticSphere>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _fadeAnimation;

  String _result = "";
  final answers = [
    "ONG FR",
    "NO CAP",
    "WWWWWS.",
    "PERIODT.",
    "SAY LESS",
    "GIVINGG",
    "IDK BRO",
    "KINDA SUS.",
    "MID.",
    "MEH",
    "EH",
    "L + RATIO",
    "NAH FAM",
    "NEGATIVE AURA",
    "SKILL ISSUE",
    "TRY AGAIN",
    "THE ICKZ",
    "BROTHER UGH",
    "YES KING",
    "ATE",
    "WTHELLY",
    "DELULU",
    "GOATED",
    "LET HIM COOK",
    "NOT GIVING",
    "SIDE EYE",
    "HINDI PO ATEEEE",
    "OMSIM",
    "DEINS",
    "DASURV",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -15), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -15, end: 15), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 15, end: -15), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -15, end: 15), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 15, end: -15), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -15, end: 15), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 15, end: -10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10, end: 5), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 5, end: 0), weight: 1),
    ]).animate(_controller);

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
    );
  }

  void _shakeSphere() {
    setState(() {
      _result = answers[Random().nextInt(answers.length)];
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
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Color(0xFFead8b1),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Text(
                    'TOUCH THE F8BALL',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pressStart2p(
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 8
                        ..color = Color(0xFF3a6d8c),
                    ),
                  ),
                  Text(
                    'TOUCH THE F8BALL',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pressStart2p(
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                      color: const Color(0xFFead8b1),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: _shakeSphere,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_animation.value, 0),
                      child: child,
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: Image.asset(
                          'assets/sphere.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      if (_result.isNotEmpty)
                        SizedBox(
                          width: 100,
                          child: FadeTransition(
                            opacity: _fadeAnimation,
                            child: Text(
                              _result,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.pressStart2p(
                                fontSize: 10,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 8,
                                    color: Color(0xFFead8b1),
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
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
