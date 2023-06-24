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
];

List iconSubMenuAccount = [
  Image.asset(
    'assets/icons/profile/meeting_room_fill.png',
  ),
  Image.asset(
    'assets/icons/profile/lock.png',
  ),
  Image.asset(
    'assets/icons/profile/delete_forever.png',
  ),
];

List iconSubMenuInformation = [
  Image.asset(
    'assets/icons/profile/privacy_tip.png',
  ),
  Image.asset(
    'assets/icons/profile/local_police.png',
  ),
  Image.asset(
    'assets/icons/profile/help_center.png',
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

                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);

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
                                'assets/icons/profile/logout.png',
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
                        const Padding(
                          padding: EdgeInsets.only(
                            right: 18,
                          ),
                          child: Padding(
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
