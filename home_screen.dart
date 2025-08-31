import 'package:flutter/material.dart';
import 'package:mystic_pick/screens/hover_box.dart';
import 'package:google_fonts/google_fonts.dart';

// Main home screen to displays F8HUB game selection interface
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // Background image decoration
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Main title with pixel styled font from Google Fonts
              Text(
                'F8HUB',
                style: GoogleFonts.pressStart2p(
                  fontSize: 60,
                  color: const Color(0xFFead8b1),
                ),
              ),
              const SizedBox(height: 50),
              // Game selection grid layout
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // First row of games
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // F8BALL - unlocked
                      Column(
                        children: [
                          HoverBox(imagePath: 'assets/8ball.png'),
                          SizedBox(height: 10),
                          Text(
                            'F8BALL',
                            style: GoogleFonts.pressStart2p(
                              color: Color(0xFFead8b1),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      // F8COOKIE - locked with overlay
                      Column(
                        children: [
                          HoverBox(
                            imagePath: 'assets/cookie.png',
                            imageLock: 'assets/lock.png',
                            overlay: true,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'F8COOKIE',
                            style: GoogleFonts.pressStart2p(
                              color: Color(0xFFead8b1),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Second row of games
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // F8DICE - locked with overlay
                      Column(
                        children: [
                          HoverBox(
                            imagePath: 'assets/dice.png',
                            imageLock: 'assets/lock.png',
                            overlay: true,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'F8DICE',
                            style: GoogleFonts.pressStart2p(
                              color: Color(0xFFead8b1),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      // F8TD (Truth or Dare) - locked with overlay
                      Column(
                        children: [
                          HoverBox(
                            imagePath: 'assets/TorD.png',
                            imageLock: 'assets/lock.png',
                            overlay: true,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'F8TD',
                            style: GoogleFonts.pressStart2p(
                              color: Color(0xFFead8b1),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
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

