// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/home/home_screen.dart';
import 'package:flutter_capstone/screens/order/order_screen.dart';
import 'package:flutter_capstone/screens/profile/profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:flutter_capstone/style/text_style.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;

  final List<Widget> _children = [
    const HomeScreen(),
    const OrderScreen(),
    const ProfileScreen()
  ];

  List<String> svgAssets = [
    'assets/icons/bottom_navigation_bar/home.svg',
    'assets/icons/bottom_navigation_bar/home-selected.svg',
    'assets/icons/bottom_navigation_bar/notes.svg',
    'assets/icons/bottom_navigation_bar/notes-selected.svg',
    'assets/icons/bottom_navigation_bar/profile.svg',
    'assets/icons/bottom_navigation_bar/profile-selected.svg',
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Keluar dari Aplikasi',
                style: setTextStyle(PrimaryColor().primary)
                    .copyWith(fontWeight: semiBold, fontSize: 17),
              ),
              content: Text('Apakah Anda yakin ingin keluar?',
                  style: setTextStyle(NeutralColor().neutral20)
                      .copyWith(fontWeight: medium, fontSize: 14)),
              actions: [
                TextButton(
                  child: Text(
                    'Tidak',
                    style: setTextStyle(PrimaryColor().primary)
                        .copyWith(fontWeight: medium, fontSize: 12),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                  child: Text(
                    'Ya',
                    style: setTextStyle(PrimaryColor().primary)
                        .copyWith(fontWeight: medium, fontSize: 12),
                  ),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
              ],
            );
          },
        );
        return false; // Menahan tombol kembali saat dialog ditampilkan
      },
      child: Scaffold(
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
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
