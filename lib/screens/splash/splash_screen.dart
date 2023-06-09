// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () async {
      var token = await getToken();
      if (token.toString() == 'null') {
        Navigator.pushNamedAndRemoveUntil(
            context, '/boarding', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, '/bottom-nav', (route) => true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF85B6FF),
              Color(0xFF1E90FF),
              Color(0xFF0031CC),
            ],
          ),
        ),
        child: Stack(
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    "assets/images/home/background-homescreen.svg",
                    fit: BoxFit.none,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: const Color(0xFF0031CC),
                  )
                ],
              ),
            ),
            Center(
              child: SizedBox(
                width: 117,
                height: 50,
                child: Image.asset("assets/logo/logo.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
