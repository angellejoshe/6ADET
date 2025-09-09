import 'package:flutter/material.dart';
import 'package:mystic_pick/screens/hover_box.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystic_pick/screens/mystic_sphere.dart';

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
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Text(
                    'F8HUB',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 60,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 12
                        ..color = Color(0xFF285c78),
                    ),
                  ),
                  Text(
                    'F8HUB',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 60,
                      color: const Color(0xFFead8b1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MysticSphere(),
                            ),
                          );
                        },
                        child: Column(
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
                      ),
                      SizedBox(width: 20),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
