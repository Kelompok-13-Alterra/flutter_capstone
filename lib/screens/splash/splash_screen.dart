import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/splash/boarding_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            : Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF85B6FF),
                              Color(0xFF1E90FF),
                              Color(0xFF0031CC),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SvgPicture.asset(
                            "assets/homescreen/background-homescreen.svg",
                            fit: BoxFit.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: SizedBox(
                      width: 117,
                      height: 50,
                      child: Image.asset("assets/logo.png"),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
