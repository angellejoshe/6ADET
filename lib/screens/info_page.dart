import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  static const double _appBarHeight = 120.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFFead8b1),
        ),
        centerTitle: true,
        toolbarHeight: _appBarHeight,
        title: Stack(
          children: [
            Text(
              'ABOUT US',
              style: GoogleFonts.pressStart2p(
                fontSize: 24,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 6
                  ..color = const Color(0xFF001f3f),
              ),
            ),
            Text(
              'ABOUT US',
              style: GoogleFonts.pressStart2p(
                fontSize: 24,
                color: const Color(0xFFead8b1),
              ),
            ),
          ],
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

        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, _appBarHeight + 10, 20, 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // ABOUT US + LOGO
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _infoCard(
                      "Welcome to F8Hub – your playful digital hub for fun, quick decisions, and lighthearted entertainment. "
                      "We designed this app to bring you classic games with a modern twist, all in one simple and engaging space.",
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/8ball.png',
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // HOW TO USE
                _sectionTitle("HOW TO USE", 22),
                const SizedBox(height: 10),
                _infotouse(
                  "Step 1: Open the app and choose a feature from the homepage.\n"
                  "→ Start by exploring the simple, clean design that highlights all available games at a glance.\n\n"
                  "Step 2: Tap on the game you want to play (8Ball, Dice, Fortune, T/F).\n"
                  "→ Each game loads instantly, giving you quick and fun answers or results with just one tap.\n\n"
                  "Step 3: Want more? Request new games directly from the homepage.\n"
                  "→ Share your ideas, and we’ll keep updating the app to bring fresh and exciting features tailored to what players want.",
                ),
                const SizedBox(height: 30),

                // OUR FEATURES
                _sectionTitle("OUR FEATURES", 22),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 12,
                  runSpacing: 15,
                  alignment: WrapAlignment.center,
                  children: [
                    _featureBox(
                      Icons.sports_baseball,
                      "8Ball",
                      "Quick decision-making fun",
                    ),
                    _featureBox(
                      Icons.casino,
                      "Dice",
                      "Roll for randomness and creativity",
                    ),
                    _featureBox(
                      Icons.help_outline,
                      "Fortune",
                      "Get playful, inspiring messages",
                    ),
                    _featureBox(
                      Icons.check_circle_outline,
                      "Truth/Dare",
                      "A wheel of instant answers, simple and fun",
                    ),
                  ],
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String text, double fontSize) {
    return Stack(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.pressStart2p(
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 7
              ..color = const Color(0xFF001f3f),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.pressStart2p(
            fontSize: fontSize,
            color: const Color(0xFFead8b1),
          ),
        ),
      ],
    );
  }

  Widget _infoCard(String text) {
    return Container(
      height: 175,
      width: 200,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xFF001f3f),
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Color(0xFFEAD8B1), offset: Offset(4, 4)),
        ],
      ),
      child: Text(
        text,
        style: GoogleFonts.handjet(
          fontSize: 16,
          color: Colors.white,
          height: 1.4,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _infotouse(String text) {
    return Container(
      width: 320,
      height: 365,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color(0xFF001f3f),
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Color(0xFFEAD8B1), offset: Offset(4, 4)),
        ],
      ),
      child: Text(
        text,
        style: GoogleFonts.handjet(
          fontSize: 16,
          color: Colors.white,
          height: 1.4,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _featureBox(IconData icon, String title, String subtitle) {
    return Container(
      width: 150,
      height: 150,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFEAD8B1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFF001f3f), width: 3),
        boxShadow: const [
          BoxShadow(color: Color(0xFF001f3f), offset: Offset(4, 4)),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 28, color: const Color(0xFF001f3f)),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.pressStart2p(
              fontSize: 12,
              color: Color(0xFF001f3f),
            ),
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.handjet(
              fontSize: 14,
              color: Colors.black87,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
