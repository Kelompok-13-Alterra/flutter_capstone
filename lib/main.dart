import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/review/review_screen.dart';
import 'package:flutter_capstone/screens/review/review_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ReviewViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // final bottomNavParamater = ModalRoute.of(context)?.settings.arguments ?? '';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Office Booking (Capstone Project Kel 13)',
      theme: ThemeData(
        primarySwatch: color,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ReviewScreen(),
      },
    );
  }
}

const MaterialColor color = MaterialColor(0xff005DB9, <int, Color>{
  50: Color(0xff005DB9),
  100: Color(0xff005DB9),
  200: Color(0xff005DB9),
  300: Color(0xff005DB9),
  400: Color(0xff005DB9),
  500: Color(0xff005DB9),
  600: Color(0xff005DB9),
  700: Color(0xff005DB9),
  800: Color(0xff005DB9),
  900: Color(0xff005DB9),
});
