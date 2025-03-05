import 'dart:async';

import 'package:flutter/material.dart';
import 'package:life_hope/presentation/resources/app_images.dart';
import 'package:life_hope/presentation/resources/resources.dart';
import 'package:life_hope/presentation/screen/login/login.dart';
import 'package:life_hope/presentation/utils/constants/sizes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xff6dbae6),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.maxFinite,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.donationLogo,
                  ),
                ),
              ),
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: AppSize.imageThumbSize * 0.5),
                child: Text(
                  "LIFE HOPE",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Color(0xffca1f4b),
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),

              // Image.asset(
              //   AppImages.donationLogo,
              // ),
              // Text(
              //   "LIFE HOPE",
              //   style: Theme.of(context).textTheme.titleLarge?.copyWith(
              //         color: Color(0xffca1f4b),
              //         fontSize: 25,
              //         fontWeight: FontWeight.w800,
              //       ),
              // )
            ),
          ],
        ),
      ),
    );
  }
}
