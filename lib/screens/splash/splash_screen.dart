import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/splash/boarding_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:your_app/home_screen.dart'; // Ganti dengan nama halaman utama aplikasi Anda

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BoardingScreen()),
      );
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
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    "assets/homescreen/background-homescreen.svg",
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
                child: Image.asset("assets/logo.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
