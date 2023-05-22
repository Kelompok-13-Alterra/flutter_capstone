// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/order/order_screen.dart';
import 'package:flutter_capstone/widgets/home/homepage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> _children = [
    const Homepage(),
    const OrderScreen(),
    const Center(
      child: Text("Ini buat page Setting"),
    ),
  ];

  List<String> svgAssets = [
    'assets/icon-botton-navigation-bar/home.svg',
    'assets/icon-botton-navigation-bar/home-selected.svg',
    'assets/icon-botton-navigation-bar/notes.svg',
    'assets/icon-botton-navigation-bar/notes-selected.svg',
    'assets/icon-botton-navigation-bar/apps-rectangle.svg',
    'assets/icon-botton-navigation-bar/apps-rectangle-selected.svg',
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.white,
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xFFC7C6CA),
        ),
        selectedLabelStyle: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF0074E5),
        ),
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  currentIndex == 0 ? svgAssets[1] : svgAssets[0],
                  height: 24,
                  width: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  currentIndex == 1 ? svgAssets[3] : svgAssets[2],
                  height: 24,
                  width: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  currentIndex == 2 ? svgAssets[5] : svgAssets[4],
                  height: 24,
                  width: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
