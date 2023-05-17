import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notification_feature/boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showBoardingScreen = false;

  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _showBoardingScreen = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: _showBoardingScreen ? Colors.white : const Color(0xFF1E90FF),
        child: _showBoardingScreen
            ? const BoardingScreen()
            : Center(
                child: SizedBox(
                  width: 117,
                  height: 50,
                  child: Image.asset("assets/logo.png"),
                ),
              ),
      ),
    );
  }
}
