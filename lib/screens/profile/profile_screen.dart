import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/profile/widget/cards_profile_widget.dart';
import 'package:flutter_capstone/screens/profile/widget/profiles_widget.dart';
import 'package:flutter_capstone/style/text_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeutralColor().neutral99,
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
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              // width: 420,
              height: 415,
              child: Container(
                color: SourceColor().white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 32,
                    bottom: 16,
                  ),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 88,
                        height: 88,
                        child: CircleAvatar(
                          backgroundColor: SecondaryColor().secondaryFixedDim,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Michael Abraham",
                              style: setTextStyle(SourceColor().black).copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.edit,
                                color: SourceColor().black,
                                size: 15,
                              ),
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
                          style:
                              setTextStyle(NeutralColor().neutral40).copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/image/meeting_room.png',
                              width: 16,
                              height: 16,
                            ),
                            Text(
                              'No Company',
                              style: setTextStyle(NeutralColor().neutral50)
                                  .copyWith(
                                fontSize: 12,
                                fontWeight: regular,
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5 - 16,
                            child: const CardsProfileWidget(
                              cardColor: Color(0xffF2F6FF),
                              icon: AssetImage(
                                "assets/image/Image_total_kantor.png",
                              ),
                              title: 'Total Kantor',
                              desc: 'yang kamu kunjungi',
                              count: 36,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5 - 16,
                            child: const CardsProfileWidget(
                              cardColor: Color(0xffFFFCF5),
                              icon: AssetImage(
                                "assets/image/Image_total_co-working.png",
                              ),
                              title: 'Total Co-working',
                              desc: 'yang kamu kunjungi',
                              count: 36,
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   height: 16,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            profilesWidget(context),
          ],
        ),
      ),
    );
  }
}
