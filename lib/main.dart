import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/home/home_screen.dart';
import 'package:flutter_capstone/screens/login/login_screen.dart';
import 'package:flutter_capstone/screens/order/order_screen.dart';
import 'package:flutter_capstone/screens/profile/profile_screen.dart';
import 'package:flutter_capstone/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_capstone/screens/splash/boarding_screen.dart';
import 'package:flutter_capstone/screens/splash/boarding_screen_second.dart';
import 'package:flutter_capstone/screens/splash/boarding_screen_third.dart';
import 'package:flutter_capstone/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Office Booking (Capstone Project Kel 13)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/sign-up': (context) => const SignUpScreen(),
        '/boarding': (context) => const BoardingScreen(),
        '/boarding-second': (context) => const BoardingScreenSecond(),
        '/boarding-third': (context) => const BoardingScreenThird(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        'order': (context) => const OrderScreen()
      },
    );
  }
}
