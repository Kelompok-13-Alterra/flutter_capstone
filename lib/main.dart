//AUTHOR : ULFA LADAYYA
//KELAS C FLUTTER
import 'package:flutter/material.dart';
import 'package:flutter_capstone/profile/profile_screen.dart';



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
        '/': (context) => const ProfileScreen(),
      },
    );
  }
}
