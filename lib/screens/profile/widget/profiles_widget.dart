import 'package:flutter/material.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/screens/login/login_view_model.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:provider/provider.dart';

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
    'assets/icons/profile/meeting_room_fill.png',
    // width: 15,
    // height: 15,
  ),
  Image.asset(
    'assets/icons/profile/lock.png',
    // width: 15,
    // height: 15,
  ),
  Image.asset(
    'assets/icons/profile/delete_forever.png',
    // width: 15,
    // height: 15,
  ),
];

List iconSubMenuInformation = [
  Image.asset(
    'assets/icons/profile/privacy_tip.png',
    // width: 15,
    // height: 15,
  ),
  Image.asset(
    'assets/icons/profile/local_police.png',
    // width: 15,
    // height: 15,
  ),
  Image.asset(
    'assets/icons/profile/help_center.png',
    // width: 15,
    // height: 15,
  ),
];

Widget profilesWidget(BuildContext context) {
  LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        // width: 360,
        height: 234,
        color: SourceColor().white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account",
                style: setTextStyle(NeutralColor().neutral30).copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: subMenuAccount.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    minLeadingWidth: 11,
                    leading: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 15,
                        minHeight: 15,
                        maxWidth: 20,
                        maxHeight: 20,
                      ),
                      child: iconSubMenuAccount[index],
                    ),
                    title: Text(
                      subMenuAccount[index],
                      style: setTextStyle(NeutralColor().neutral30).copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {},
                      child: const Padding(
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
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        // width: 360,
        height: 280,
        color: SourceColor().white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Information",
                style: setTextStyle(NeutralColor().neutral30).copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: subMenuInformation.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    minLeadingWidth: 11,
                    leading: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 15,
                        minHeight: 15,
                        maxWidth: 20,
                        maxHeight: 20,
                      ),
                      child: iconSubMenuInformation[index],
                    ),
                    title: Text(
                      subMenuInformation[index],
                      style: setTextStyle(NeutralColor().neutral30).copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {},
                      child: const Padding(
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
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  removeToken();
                  loginViewModel.getEmail.clear();
                  loginViewModel.getPassword.clear();
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);

                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Berhasil keluar!')));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 15,
                                minHeight: 15,
                                maxWidth: 20,
                                maxHeight: 20,
                              ),
                              child: Image.asset(
                                'assets/image/logout.png',
                              ),
                            ),
                            const SizedBox(
                              width: 11,
                            ),
                            Text(
                              "Log Out",
                              style: setTextStyle(NeutralColor().neutral30)
                                  .copyWith(
                                fontSize: 12,
                                fontWeight: regular,
                              ),
                            ),
                          ],
                        ),
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 18,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                              right: 21.53,
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_right_sharp,
                              color: Color(0xFF292A2D),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 4,
      ),
    ],
  );
}
