import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ===== Fixed XR-style measurements =====
const double kTitleFont = 36;
const double kTitleStroke = 8;
const Color kTitleFill = Color(0xFFead8b1);
const Color kTitleStrokeColor = Color(0xFF001f3f);

const double kTopGap = 50;
const double kBetweenTitle = 10;
const double kTitleToWheel = 30;

/// Wheel & Arrow (arrow rests exactly on rim)
const double kWheelSize = 420; // circle diameter
const double kArrowWidth = 50; // increased from 32 → 50
const double kArrowFineAdjustPx = 0; // fine tweak: 0, -2, +2

/// Spin button
const double kSpinBtnWidth = 250;
const double kSpinBtnHeight = 56;
const double kSpinBtnRadius = 28;
const double kSpinBtnBorderW = 2;
const Color kSpinBtnBorder = Color(0xFF001f3f);
const List<BoxShadow> kSpinBtnShadow = [
  BoxShadow(color: Color(0xFFead8b1), offset: Offset(6, 6), blurRadius: 0),
];
const LinearGradient kSpinBtnGrad = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Color(0xFF001f3f), Color(0xFF02376c)],
);
const double kBottomGap = 54;

class TruthOrDarePage extends StatefulWidget {
  const TruthOrDarePage({super.key});

  @override
  State<TruthOrDarePage> createState() => _TruthOrDarePageState();
}

class _TruthOrDarePageState extends State<TruthOrDarePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;
  bool _spinning = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    );
    _rotation = Tween<double>(
      begin: 0,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.addStatusListener((s) {
      if (s == AnimationStatus.completed) setState(() => _spinning = false);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _spin() {
    if (_spinning) return;
    setState(() => _spinning = true);

    // Fresh full spin; land on Truth (left) or Dare (right)
    final isTruth = Random().nextBool();
    final fullTurns = 3 + Random().nextInt(3); // 3..5
    final target = fullTurns * 2 * pi + (isTruth ? pi / 2 : -pi / 2);

    _rotation = Tween<double>(
      begin: 0,
      end: target,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller
      ..reset()
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mysticspherebg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: kTopGap),

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

                  const SizedBox(height: kTitleToWheel),

                  // ----- Arrow + Wheel in one Stack for perfect alignment -----
                  SizedBox(
                    width: kWheelSize,
                    height: kWheelSize + (kArrowWidth / 2),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        // Arrow
                        Positioned(
                          top: -(kArrowWidth / 2) + kArrowFineAdjustPx,
                          child: Image.asset(
                            'assets/Arrow.png',
                            width: kArrowWidth,
                            fit: BoxFit.contain,
                          ),
                        ),

                        // Wheel
                        Positioned(
                          top: (kArrowWidth / 2),
                          left: 0,
                          right: 0,
                          child: AnimatedBuilder(
                            animation: _controller,
                            builder: (_, __) => Transform.rotate(
                              angle: _rotation.value,
                              child: ClipOval(
                                child: SizedBox(
                                  width: kWheelSize,
                                  height: kWheelSize,
                                  child: Image.asset(
                                    'assets/TruthorDare.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  _SpinButton(
                    label: _spinning ? 'SPINNING...' : 'SPIN',
                    onTap: _spin,
                    enabled: !_spinning,
                  ),

                  const SizedBox(height: kBottomGap),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SpinButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool enabled;
  const _SpinButton({
    required this.label,
    required this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.6,
      child: GestureDetector(
        onTap: enabled ? onTap : null,
        child: Container(
          width: kSpinBtnWidth,
          height: kSpinBtnHeight,
          decoration: BoxDecoration(
            gradient: kSpinBtnGrad,
            borderRadius: BorderRadius.circular(kSpinBtnRadius),
            border: Border.all(color: kSpinBtnBorder, width: kSpinBtnBorderW),
            boxShadow: kSpinBtnShadow,
          ),
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                label,
                style: GoogleFonts.pressStart2p(
                  fontSize: 16,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = kSpinBtnBorder,
                ),
              ),
              Text(
                label,
                style: GoogleFonts.pressStart2p(
                  fontSize: 16,
                  color: kTitleFill,
                ),
              ),
            ],
          ),
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
