import 'package:flutter/material.dart';
import 'package:flutter_capstone_order_tab_bar/screens/order_tab.dart';

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
      // initialRoute: '/',
      home: const OrderTabScreen(),
      // routes: {
      //   '/': (context) => const SplashScreen(),
      //   '/login': (context) => const LoginScreen(),
      //   '/sign-up': (context) => const SignUpScreen(),
      //   '/boarding': (context) => const BoardingScreen(),
      //   '/boarding-second': (context) => const BoardingScreenSecond(),
      //   '/boarding-third': (context) => const BoardingScreenThird(),
      //   '/home': (context) => const HomeScreen(),
      //   '/circle-avatar-home-screen': (context) =>
      //       const CircleAvatarHomeScreen(),
      //   '/profile': (context) => const ProfileScreen(),
      // },
    );
  }
}
