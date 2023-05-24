import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/home/widget_home/background_widget.dart';
import 'package:flutter_capstone/screens/home/widget_home/filterchoice.dart';
import 'package:flutter_capstone/screens/home/widget_home/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          BackgroundWidget(),
          FilterChoice(),
          HomeWidget(),
        ],
      ),
    );
  }
}
