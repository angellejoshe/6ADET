import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystic_pick/screens/hover.dart';

class F8Request extends StatefulWidget {
  const F8Request({super.key});
  @override
  State<F8Request> createState() => _F8RequestState();
}

class _F8RequestState extends State<F8Request> {
  final TextEditingController _controller = TextEditingController();
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
                    'F8REQUEST',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pressStart2p(
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 8
                        ..color = Color(0xFF001f3f),
                    ),
                  ),
                  Text(
                    'F8REQUEST',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pressStart2p(
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                      color: const Color(0xFFead8b1),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Text(
                    'Request a game for us to develop next!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.handjet(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = Color(0xFF001f3f),
                    ),
                  ),
                  Text(
                    'Request a game for us to develop next!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.handjet(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF001f3f), Color(0xFF02376c)],
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Color(0xFFEAD8B1), offset: Offset(6, 6)),
                  ],
                ),
                child: TextField(
                  controller: _controller,
                  style: GoogleFonts.handjet(color: Colors.white),
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Type here...",
                    hintStyle: TextStyle(color: Colors.white54),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear, color: Color(0xFFEAD8B1)),
                      onPressed: () {
                        setState(() {
                          _controller.clear();
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Hover(
                child: Stack(
                  children: [
                    Text(
                      "SUBMIT",
                      style: GoogleFonts.pressStart2p(
                        fontSize: 13,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 4
                          ..color = const Color(0xFF001f3f),
                      ),
                    ),
                    Text(
                      "SUBMIT",
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
}
