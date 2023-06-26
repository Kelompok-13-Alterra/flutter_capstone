import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/profile/profile_model.dart';
import 'package:flutter_capstone/screens/profile/widget/cards_profile_widget.dart';
import 'package:flutter_capstone/screens/profile/widget/profiles_widget.dart';
import 'package:flutter_capstone/services/profile/profile_service.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<dynamic>? provileaViewModel;
  @override
  void initState() {
    final provileService = Provider.of<ProfileService>(context, listen: false);
    provileaViewModel = provileService.getProfile();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeutralColor().neutral99,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: SourceColor().white,
        title: Text(
          "Profile",
          style: setTextStyle(NeutralColor().neutral12)
              .copyWith(fontSize: 16, fontWeight: regular),
        ),
      ),
      body: FutureBuilder(
        future: provileaViewModel,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            var profile = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
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
                              width: 100,
                              height: 100,
                              child: CircleAvatar(
                                backgroundColor:
                                    SecondaryColor().secondaryFixedDim,
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
                                    '${profile?.data.name}',
                                    style: setTextStyle(SourceColor().black)
                                        .copyWith(
                                      fontSize: 14,
                                      fontWeight: medium,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      //Mengirim argument value profile ke edit profile form
                                      Navigator.of(context).pushNamed(
                                        '/edit-profile',
                                        arguments: EditProfileArguments(
                                            profileModel: profile,
                                            userId: profile?.data.id),
                                      );
                                    },
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
                                '${profile?.data.email}',
                                style: setTextStyle(NeutralColor().neutral40)
                                    .copyWith(
                                  fontSize: 16,
                                  fontWeight: regular,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/profile/meeting_room.png',
                                    width: 16,
                                    height: 16,
                                  ),
                                  Text(
                                    '${profile?.data.company}' == ''
                                        ? 'No Company'
                                        : '${profile?.data.company}',
                                    style:
                                        setTextStyle(NeutralColor().neutral50)
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.5 -
                                          16,
                                  child: const CardsProfileWidget(
                                    cardColor: Color(0xffF2F6FF),
                                    icon: AssetImage(
                                      "assets/images/profile/image_total_kantor.png",
                                    ),
                                    title: 'Total Kantor',
                                    desc: 'yang kamu kunjungi',
                                    count: 36,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5 -
                                          16,
                                  child: const CardsProfileWidget(
                                    cardColor: Color(0xffFFFCF5),
                                    icon: AssetImage(
                                      "assets/images/profile/image_total_co-working.png",
                                    ),
                                    title: 'Total Co-working',
                                    desc: 'yang kamu kunjungi',
                                    count: 36,
                                  ),
                                ),
                              ],
                            ),
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
            );
          } else if (snapshot.hasError) {
            Text(
              snapshot.error.toString(),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}

class EditProfileArguments {
  final ProfileModel? profileModel;
  final int userId;

  EditProfileArguments({this.profileModel, required this.userId});
}
