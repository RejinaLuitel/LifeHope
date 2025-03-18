import 'dart:async';

import 'package:flutter/material.dart';
import 'package:life_hope/presentation/resources/app_images.dart';
import 'package:life_hope/presentation/resources/resources.dart';

import '../../login/view/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this, //vertical synchronization need to have singleTicker
    )..repeat(reverse: false);

    _animation = Tween<double>(begin: 500, end: 600).animate(_controller)
      //Calls the listener every time the value of the animation changes
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();

    //The animation plays once instead of looping
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6dbae6),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: _animation.value,
            width: _animation.value,
            alignment: Alignment.center,
            child: Center(
              child: Image.asset(
                AppImages.donationLogo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
