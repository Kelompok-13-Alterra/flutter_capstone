import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/padding_style.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/widgets/profile/card_profile.dart';
import 'package:flutter_capstone/widgets/profile/profile_widget.dart';

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
          style: setTextStyle(NeutralColor().neutral12)
              .copyWith(fontSize: 16, fontWeight: regular),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: NeutralColor().neutral0,
          onPressed: () {
            Navigator.pop(context);
          },
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
      body: SingleChildScrollView(
        child: Column(
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
                        style: setTextStyle(SourceColor().black).copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
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
                    style: setTextStyle(NeutralColor().neutral40).copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
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
                        style: setTextStyle(NeutralColor().neutral50).copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                        ),
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
      ),
    );
  }
}
