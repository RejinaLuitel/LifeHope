import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:life_hope/presentation/widgets/progress_painter.dart';
import 'package:life_hope/presentation/widgets/wave_painter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late final AnimationController progressController;
  late final AnimationController waveController;
  late final Animation<double> progressAnimation;
  // late final Animation<double> waveAnimation;
  late final double sphereRadius;

  @override
  void initState() {
    super.initState();
    progressController = AnimationController(vsync: this, duration: Duration(seconds: 10));
    waveController = AnimationController(vsync: this, duration: Duration(milliseconds: 700));

    progressAnimation = Tween<double>(begin: 0, end: 100).animate(progressController);
    progressController.addListener(_progressListener);
    waveController.repeat();
  }

  void _progressListener() {
    if (progressController.isCompleted) setState(() {});
  }

  @override
  void dispose() {
    progressController.dispose();
    waveController.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget? widget) {
    return WaveAnimation(
      progressAnimation: progressController,
      waveAnimation: waveController,
      sphereRadius: 100,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003366),
      body: AnimatedBuilder(
        animation: waveController,
        builder: _buildAnimation,
      ),
    );
  }
}

class WaveAnimation extends StatelessWidget {
  const WaveAnimation({
    super.key,
    required Animation<double> progressAnimation,
    required Animation<double> waveAnimation,
    required this.sphereRadius,
  })  : _progressAnimation = progressAnimation,
        _waveAnimation = waveAnimation;

  final Animation<double> _progressAnimation;
  final Animation<double> _waveAnimation;
  final double sphereRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CustomPaint(
        painter: WavePainter(
          progress: _progressAnimation,
          waveAnimation: _waveAnimation,
          circleRadius: sphereRadius,
        ),
      ),
    );
  }
}
