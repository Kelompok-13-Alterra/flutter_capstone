import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/padding_style.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/screens/profile/cards_profile_widget.dart';
import 'package:flutter_capstone/screens/profile/profiles_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Profile",
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: regular,
          ),
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
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: PaddingCircleAvatarProfile().padding11,
                child: Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kLightSecondaryColor,
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
                      style: sourceBlackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                    IconButton(
                      splashRadius: 10,
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      color: kSourceBlackColor,
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
                      style: neutral50TextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          CardsProfileWidget(
            padding1: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 20,
            ),
            height1: 136,
            width1: 156,
            cardColor1: const Color(0xFFF2F6FF),
            border: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding2: const EdgeInsets.only(
              top: 16,
              left: 16,
              bottom: 12,
            ),
            img1: const AssetImage(
              "assets/image/Image_total_kantor.png",
            ),
            height2: 24,
            width2: 24,
            height3: 4,
            text1: 'Total Kantor',
            style1: neutralVariant30TextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
            height4: 4,
            text2: 'yang kamu kunjungi',
            style2: neutralVariant60TextStyle.copyWith(
              fontSize: 12,
              fontWeight: regular,
            ),
            height5: 4,
            text3: '36',
            style3: sourceBlackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: regular,
            ),
            height6: 136,
            width6: 156,
            cardColor2: const Color(0xFFFFFCF5),
            padding3: const EdgeInsets.only(
              top: 16,
              left: 16,
              bottom: 12,
            ),
            img2: const AssetImage(
              "assets/image/Image_total_co-working.png",
            ),
            height7: 24,
            width7: 24,
            height8: 4,
            text4: 'Total Co-working',
            style4: neutralVariant30TextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
            height9: 4,
            text5: 'yang kamu kunjungi',
            style5: neutralVariant60TextStyle.copyWith(
              fontSize: 12,
              fontWeight: regular,
            ),
            height10: 4,
            text6: '36',
            style6: sourceBlackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: regular,
            ),
          ),
          profilesWidget(context),
        ],
      ),
    );
  }
}
