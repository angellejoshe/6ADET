import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vm;

class Cube extends StatelessWidget {
  const Cube({
    super.key,
    this.size = 120,
    this.rotationX = 0,
    this.rotationY = 0,
  });

  final double size;
  final double rotationX;
  final double rotationY;

  @override
  Widget build(BuildContext context) {
    final double half = size / 2;
    const double perspective = 0.0012;

    // Build a transform for a face
    vm.Matrix4 face(double rx, double ry, double tz) {
      final vm.Matrix4 m = vm.Matrix4.identity()..setEntry(3, 2, perspective);
      final vm.Matrix4 orient = vm.Matrix4.identity()
        ..rotateX(rx)
        ..rotateY(ry);
      final vm.Matrix4 trans = vm.Matrix4.translationValues(0, 0, tz);
      m.multiply(orient);
      m.multiply(trans);
      return m;
    }

    // Fully covered cube face
    Widget side(String asset) => SizedBox(
      width: size,
      height: size,
      child: FittedBox(fit: BoxFit.cover, child: Image.asset(asset)),
    );

    return Transform(
      alignment: Alignment.center,
      transform: vm.Matrix4.identity()
        ..setEntry(3, 2, perspective)
        ..rotateX(rotationX)
        ..rotateY(rotationY),
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: face(0, 0, half),
              child: side('assets/dice1.png'),
            ),
            Transform(
              alignment: Alignment.center,
              transform: face(0, math.pi, half),
              child: side('assets/dice2.png'),
            ),
            Transform(
              alignment: Alignment.center,
              transform: face(0, -math.pi / 2, half),
              child: side('assets/dice3.png'),
            ),
            Transform(
              alignment: Alignment.center,
              transform: face(0, math.pi / 2, half),
              child: side('assets/dice4.png'),
            ),
            Transform(
              alignment: Alignment.center,
              transform: face(-math.pi / 2, 0, half),
              child: side('assets/dice5.png'),
            ),
            Transform(
              alignment: Alignment.center,
              transform: face(math.pi / 2, 0, half),
              child: side('assets/dice6.png'),
            ),
          ],
        ),
      ),
    );
  }
}
