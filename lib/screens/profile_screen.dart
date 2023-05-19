import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/padding_style.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/widget/card_profile.dart';
import 'package:flutter_capstone/widget/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Profile",
          style: TextTitleProfile().text24,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 22,
              top: 21,
              bottom: 19,
            ),
            child: Icon(
              Icons.more_vert_rounded,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: PaddingCircleAvatarProfile().padding11,
                child: Container(
                  width: 88,
                  height: 88,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF97CBFF),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Michael Abraham",
                      style: TextNameOfUser().text18,
                    ),
                    IconButton(
                      splashRadius: 10,
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      color: const Color(0xFF000000),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: Text(
                  "michaelabraham@gmail.com",
                  style: TextGmail().text19,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/meeting_room.png',
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'No Company',
                      style: TextNoCompany().text20,
                    )
                  ],
                ),
              ),
            ],
          ),
          cardProfile(context),
          profileWidget(context),
        ],
      ),
    );
  }
}
