import 'dart:math';

import 'package:flutter/material.dart';

const foregroundWaveColor = Color(0xFF00aaff);
const backgroundWaveColor = Color(0xFF0073E6);

class WavePainter extends CustomPainter {
  final Animation<double> progress;
  final Animation<double> waveAnimation;
  final double circleRadius;
  WavePainter({
    required this.progress,
    required this.waveAnimation,
    required this.circleRadius,
  }) : super(repaint: Listenable.merge([progress, waveAnimation]));

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2); // Center of screen
    canvas.translate(center.dx, center.dy);
    _drawWaves(canvas);
  }

  void _drawWaves(Canvas canvas) {
    // canvas.clipPath(
    //   Path()
    //     ..addOval(
    //       Rect.fromCircle(
    //         center: Offset.zero,
    //         radius: circleRadius,
    //       ),
    //     ),
    // );

    _drawSineWave(canvas, backgroundWaveColor);

    _drawSineWave(canvas, foregroundWaveColor, mirror: true, shift: circleRadius / 2);
  }

  void _drawSineWave(Canvas canvas, Color waveColor, {double shift = 0.0, bool mirror = false}) {
    if (mirror) {
      canvas.save();
      canvas.transform(Matrix4.rotationY(pi).storage);
    }

    double startX = -100;
    double endX = 100;
    double startY = 100;
    double endY = -100;

    double amplitude = circleRadius * 0.15;
    double angularVelocity = pi / 200;
    double delta = Curves.slowMiddle.transform(progress.value);

    double offsetX = 2 * circleRadius * waveAnimation.value + shift;
    double offsetY = startY + (endY - startY - amplitude) * delta;

    Paint wavePaint = Paint()
      ..color = waveColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 2
      ..isAntiAlias = true;

    Path path = Path();

    for (double x = startX; x <= endX; x++) {
      /// y = A * sin(ωx + φ)
// A (Amplitude): Determines the wave’s height.
// ω (Angular frequency): Controls how rapidly the wave oscillates along the x-axis, affecting the wavelength.
// φ (Phase shift): Moves the wave along the x-axis, useful for creating the feeling of motion. In our case it is offsetX
// k (Vertical shift): Moves the entire wave up or down on the y-axis. In our case it is offsetY
      double y = amplitude * sin(angularVelocity * (x + offsetX));
      if (x == startX) {
        path.moveTo(x, y + offsetY);
      } else {
        path.lineTo(x, y + offsetY);
      }
    }

    path.lineTo(endX, startY);
    path.lineTo(startX, startY);
    path.close();

    canvas.drawPath(path, wavePaint);
    if (mirror) canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
