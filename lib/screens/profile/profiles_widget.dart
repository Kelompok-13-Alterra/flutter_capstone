import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

class IconSubMenu {
  final String urlImg;
  final double height;
  final double width;
  IconSubMenu({
    required this.urlImg,
    required this.height,
    required this.width,
  });
}

List<String> subMenuAccount = [
  'Company',
  'Change Password',
  'Delete Account',
];

List<String> subMenuInformation = [
  'Privacy Policy',
  'Terms and Condition',
  'Help Centre',
  // 'Log Out'
];

List iconSubMenuAccount = [
  Image.asset(
    'assets/image/meeting_room_fill.png',
    width: 15,
    height: 15,
  ),
  Image.asset(
    'assets/image/lock.png',
    width: 15,
    height: 15,
  ),
  Image.asset(
    'assets/image/delete_forever.png',
    width: 15,
    height: 15,
  ),
];

List iconSubMenuInformation = [
  Image.asset(
    'assets/image/privacy_tip.png',
    width: 15,
    height: 15,
  ),
  Image.asset(
    'assets/image/local_police.png',
    width: 15,
    height: 15,
  ),
  Image.asset(
    'assets/image/help_center.png',
    width: 15,
    height: 15,
  ),
];

Widget profilesWidget(BuildContext context) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(
        left: 16,
        bottom: 16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              // bottom: 16,
            ),
            child: Text(
              "Account",
              style: setTextStyle(NeutralColor().neutral30).copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: subMenuAccount.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  minLeadingWidth: 11,
                  leading: iconSubMenuAccount[index],
                  title: Text(
                    subMenuAccount[index],
                    style: setTextStyle(NeutralColor().neutral30).copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                  trailing: IconButton(
                    splashRadius: 5,
                    onPressed: () {},
                    icon: const Padding(
                      padding: EdgeInsets.only(
                        right: 21.53,
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Color(0xFF292A2D),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: Text(
              "Information",
              style: setTextStyle(NeutralColor().neutral30).copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: subMenuInformation.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  minLeadingWidth: 11,
                  leading: iconSubMenuInformation[index],
                  title: Text(
                    subMenuInformation[index],
                    style: setTextStyle(NeutralColor().neutral30).copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                  trailing: IconButton(
                    splashRadius: 5,
                    onPressed: () {},
                    icon: const Padding(
                      padding: EdgeInsets.only(
                        right: 21.53,
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Color(0xFF292A2D),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/image/logout.png',
                      width: 15,
                      height: 15,
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Text(
                      "Log Out",
                      style: setTextStyle(NeutralColor().neutral30).copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 18,
                  ),
                  child: IconButton(
                    splashRadius: 5,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_right_sharp,
                      color: Color(0xFF292A2D),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
