import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_capstone/boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 1), () async {
      await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const BoardingScreen(),
          //Jika belum handle ke halaman sign up
        ),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF85B6FF),
            Color(0xFF1E90FF),
            Color(0xFF0031CC),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
            child: SizedBox(
          width: 117,
          height: 50,
          child: Image.asset("assets/logo.png"),
        )),
      ),
    );
  }
}
