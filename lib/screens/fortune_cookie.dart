import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystic_pick/screens/hover.dart';

// Clipper classes (split image in half)
class LeftHalfClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRect(Rect.fromLTWH(0, 0, size.width * 0.43, size.height));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class RightHalfClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRect(
      Rect.fromLTWH(size.width * 0.43, 0, size.width * 0.6, size.height),
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class FortuneCookie extends StatefulWidget {
  const FortuneCookie({super.key});

  @override
  State<FortuneCookie> createState() => _FortuneCookieState();
}

class _FortuneCookieState extends State<FortuneCookie>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _opened = false;

  final List<String> fortunes = [
    "Good things take time 🍀",
    "Your destiny is bright ✨",
    "A new adventure awaits 🚀",
    "Trust the timing of your life 🌙",
    "Happiness is near 💫",
  ];
  late String selectedFortune;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    selectedFortune = (fortunes..shuffle()).first;
  }

  void _openCookie() {
    if (_opened) return;
    setState(() {
      _opened = true;
      selectedFortune = (fortunes..shuffle()).first;
    });
    _controller.forward();
  }

  void _resetCookie() {
    setState(() => _opened = false);
    _controller.reverse(from: 1.0);
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
                    'OPEN THE COOKIE',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pressStart2p(
                      fontSize: 32,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 8
                        ..color = const Color(0xFF001f3f),
                    ),
                  ),
                  Text(
                    'OPEN THE COOKIE',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pressStart2p(
                      fontSize: 32,
                      color: const Color(0xFFead8b1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              GestureDetector(
                onTap: _opened ? _resetCookie : _openCookie,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    final leftRotation = -_animation.value * 0.5;
                    final rightRotation = _animation.value * 0.5;
                    final verticalOffset = -20 * _animation.value;

                    // Cookie fades out while fortune fades in
                    final cookieOpacity = 1 - _animation.value;
                    final fortuneOpacity = _animation.value;

                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        // Cookie halves (fade out)
                        Opacity(
                          opacity: cookieOpacity.clamp(0.0, 1.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Transform.translate(
                                offset: Offset(
                                  -80 * _animation.value,
                                  verticalOffset,
                                ),
                                child: Transform.rotate(
                                  angle: leftRotation,
                                  alignment: Alignment.centerRight,
                                  child: ClipPath(
                                    clipper: LeftHalfClipper(),
                                    child: Image.asset(
                                      'assets/fortunecookie.png',
                                      width: 250,
                                    ),
                                  ),
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(
                                  80 * _animation.value,
                                  verticalOffset,
                                ),
                                child: Transform.rotate(
                                  angle: rightRotation,
                                  alignment: Alignment.centerLeft,
                                  child: ClipPath(
                                    clipper: RightHalfClipper(),
                                    child: Image.asset(
                                      'assets/fortunecookie.png',
                                      width: 250,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Fortune fades in
                        Opacity(
                          opacity: fortuneOpacity.clamp(0.0, 1.0),
                          child: Transform.scale(
                            scale: fortuneOpacity,
                            child: Container(
                              margin: const EdgeInsets.only(top: 100),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(
                                selectedFortune,
                                style: GoogleFonts.pressStart2p(
                                  fontSize: 10,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 60),

              Hover(
                onTap: _opened ? _resetCookie : _openCookie,
                child: Stack(
                  children: [
                    Text(
                      _opened ? "AGAIN" : "OPEN",
                      style: GoogleFonts.pressStart2p(
                        fontSize: 13,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 4
                          ..color = const Color(0xFF001f3f),
                      ),
                    ),
                    Text(
                      _opened ? "AGAIN" : "OPEN",
                      style: GoogleFonts.pressStart2p(
                        fontSize: 13,
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
