// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class CircleAvatarHomeScreen extends StatefulWidget {
  const CircleAvatarHomeScreen({super.key});

  @override
  State<CircleAvatarHomeScreen> createState() => _CircleAvatarHomeScreenState();
}

class _CircleAvatarHomeScreenState extends State<CircleAvatarHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            height: 32,
            width: 32,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 29.33,
                  right: 16,
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/image/Avatar.png'),
                ),
              ),
            ),
          )
        ],
      ),
      body: const Column(),
    );
  }
}
