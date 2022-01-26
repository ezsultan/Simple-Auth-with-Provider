// import 'dart:async';

import 'dart:async';

import 'package:get/get.dart';

import '../shared/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Get.offAndToNamed('signin');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo_white.png',
              width: 72,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'EZcommerce',
              style: whiteTextstyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
