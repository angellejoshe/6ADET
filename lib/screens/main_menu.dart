import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'spin_bottle_page.dart';
import 'truth_or_dare_page.dart';

/// ===== Measurements copied from your HomeScreen style =====
/// Title text
const double kTitleFont = 36;
const double kTitleStroke = 8;
const Color kTitleFill = Color(0xFFead8b1);
const Color kTitleStrokeColor = Color(0xFF001f3f);

/// Label text under tiles
const double kLabelFont = 18;
const double kLabelStroke = 6;
const Color kLabelStrokeColor = Color(0xFF285c78);

/// Spacing (px)
const double kTopGap = 20;
const double kBetweenTitle = 10;
const double kTitleToFirstTile = 30;
const double kTileToLabel = 20;
const double kBetweenTiles = 25;

/// Tile / box (copying the look & feel of HoverBox)
const double kTileSide = 200; // adjust if your HoverBox uses a different size
const double kTileRadius = 30;
const EdgeInsets kTilePadding = EdgeInsets.all(24);
const List<BoxShadow> kTileShadow = [
  BoxShadow(color: Color(0xFFead8b1), offset: Offset(7, 10), blurRadius: 0),
];
const LinearGradient kTileGradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Color(0xFF001f3f), Color(0xFF3a6d8c)],
);

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

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
        // Background size/fit mirrors your HomeScreen (BoxFit.fill)
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mysticspherebg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              // keeps layout safe on very small devices
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: kTopGap),

                  // ===== Titles ("TRUTH OR" / "DARE") with the same stacked stroke/fill =====
                  _strokeFillText(
                    'TRUTH OR',
                    fontSize: kTitleFont,
                    strokeWidth: kTitleStroke,
                    stroke: kTitleStrokeColor,
                    fill: kTitleFill,
                  ),
                  const SizedBox(height: kBetweenTitle),
                  _strokeFillText(
                    'DARE',
                    fontSize: kTitleFont,
                    strokeWidth: kTitleStroke,
                    stroke: kTitleStrokeColor,
                    fill: kTitleFill,
                  ),

                  const SizedBox(height: kTitleToFirstTile),

                  // ===== Tile 1: Truth or Dare =====
                  _MenuTile(
                    side: kTileSide,
                    child: Image.asset('assets/TorD.png', fit: BoxFit.fill),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const TruthOrDarePage(),
                      ),
                    ),
                  ),
                  const SizedBox(height: kTileToLabel),
                  _strokeFillText(
                    'TRUTH OR DARE',
                    fontSize: kLabelFont,
                    strokeWidth: kLabelStroke,
                    stroke: kLabelStrokeColor,
                    fill: kTitleFill,
                  ),

                  const SizedBox(height: kBetweenTiles),

                  // ===== Tile 2: Spin the Bottle =====
                  _MenuTile(
                    side: kTileSide,
                    child: Image.asset('assets/Bottle.png', fit: BoxFit.fill),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SpinBottlePage()),
                    ),
                  ),
                  const SizedBox(height: kTileToLabel),
                  _strokeFillText(
                    'SPIN THE BOTTLE',
                    fontSize: kLabelFont,
                    strokeWidth: kLabelStroke,
                    stroke: kLabelStrokeColor,
                    fill: kTitleFill,
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final double side;
  final Widget child;
  final VoidCallback onTap;
  const _MenuTile({
    required this.side,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: side,
        height: side,
        decoration: BoxDecoration(
          gradient: kTileGradient,
          borderRadius: BorderRadius.circular(kTileRadius),
          boxShadow: kTileShadow,
        ),
        padding: kTilePadding,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kTileRadius - 6),
          child: FittedBox(fit: BoxFit.contain, child: child),
        ),
      ),
    );
  }
}

Widget _strokeFillText(
  String text, {
  required double fontSize,
  required double strokeWidth,
  required Color stroke,
  required Color fill,
}) {
  final fillStyle = GoogleFonts.pressStart2p(fontSize: fontSize, color: fill);
  final strokeStyle = fillStyle.copyWith(
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = stroke,
  );
  return Stack(
    alignment: Alignment.center,
    children: [
      Text(text, style: strokeStyle, textAlign: TextAlign.center),
      Text(text, style: fillStyle, textAlign: TextAlign.center),
    ],
  );
}
