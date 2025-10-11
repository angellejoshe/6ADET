import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mystic_pick/screens/hover.dart';

class F8Request extends StatefulWidget {
  const F8Request({super.key});

  @override
  State<F8Request> createState() => _F8RequestState();
}

class _F8RequestState extends State<F8Request> {
  final TextEditingController _controller = TextEditingController();
  bool _isSubmitted = false;
  bool _isSending = false;

  final String serviceId = 'service_up9wf3l';
  final String templateId = 'template_6094otm';
  final String publicKey = 'UHNvNrnoj1Y552AGg';

  Future<void> sendEmail(String message) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost:55438',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': publicKey,
        'template_params': {'message': message},
      }),
    );

    if (response.statusCode == 200) {
      debugPrint('✅ Email sent successfully!');
    } else {
      debugPrint('❌ Failed to send email: ${response.body}');
    }
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
              // ===== Title =====
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
                        ..color = const Color(0xFF001f3f),
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

              // ===== Subtitle =====
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
                        ..color = const Color(0xFF001f3f),
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

              const SizedBox(height: 20),

              // ===== Input Box / Thank You Message =====
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
                child: _isSubmitted
                    ? Center(
                        child: Text(
                          "THANK YOU FOR SUBMITTING A REQUEST!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.handjet(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      )
                    : TextField(
                        controller: _controller,
                        style: GoogleFonts.handjet(color: Colors.white),
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type here...",
                          hintStyle: const TextStyle(color: Colors.white54),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.clear,
                              color: Color(0xFFEAD8B1),
                            ),
                            onPressed: () => _controller.clear(),
                          ),
                        ),
                      ),
              ),

              const SizedBox(height: 40),

              _isSending
                  ? const CircularProgressIndicator(color: Colors.white)
                  : TextButton(
                      onPressed: () async {
                        if (_controller.text.trim().isEmpty) return;
                        setState(() => _isSending = true);

                        await sendEmail(_controller.text.trim());

                        setState(() {
                          _isSubmitted = true;
                          _isSending = false;
                          _controller.clear();
                        });
                      },
                      child: Hover(
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
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
