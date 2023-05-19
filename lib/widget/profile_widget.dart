import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

Widget profileWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 16,
      // bottom: 16,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Account",
          style: TextTitleAccountInfo().text25,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const ImageIcon(
                  AssetImage('assets/image/meeting_room_fill.png'),
                  color: Color(0xFF77777A),
                  size: 12,
                ),
                const SizedBox(
                  width: 11,
                ),
                Text(
                  "Company",
                  style: SubAccountInfo().text26,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 21.53,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const ImageIcon(
                  AssetImage('assets/image/lock.png'),
                  color: Color(0xFF77777A),
                  size: 12,
                ),
                const SizedBox(
                  width: 11,
                ),
                Text(
                  "Change Password",
                  style: SubAccountInfo().text26,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 21.53,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const ImageIcon(
                  AssetImage('assets/image/delete_forever.png'),
                  color: Color(0xFF77777A),
                  size: 12,
                ),
                const SizedBox(
                  width: 11,
                ),
                Text(
                  "Delete Account",
                  style: SubAccountInfo().text26,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 21.53,
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
        const SizedBox(
          height: 20,
        ),
        Text(
          "Information",
          style: TextTitleAccountInfo().text25,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const ImageIcon(
                  AssetImage('assets/image/privacy_tip.png'),
                  color: Color(0xFF77777A),
                  size: 12,
                ),
                const SizedBox(
                  width: 11,
                ),
                Text(
                  "Privacy Policy",
                  style: SubAccountInfo().text26,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 21.53,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const ImageIcon(
                  AssetImage('assets/image/local_police.png'),
                  color: Color(0xFF77777A),
                  size: 12,
                ),
                const SizedBox(
                  width: 11,
                ),
                Text(
                  "Terms and Condition",
                  style: SubAccountInfo().text26,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 21.53,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const ImageIcon(
                  AssetImage('assets/image/help_center.png'),
                  color: Color(0xFF77777A),
                  size: 12,
                ),
                const SizedBox(
                  width: 11,
                ),
                Text(
                  "Help Centre",
                  style: SubAccountInfo().text26,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 21.53,
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
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const ImageIcon(
                  AssetImage('assets/image/logout.png'),
                  color: Color(0xFF77777A),
                  size: 12,
                ),
                const SizedBox(
                  width: 11,
                ),
                Text(
                  "Log Out",
                  style: SubAccountInfo().text26,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 21.53,
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
      ],
    ),
  );
}
