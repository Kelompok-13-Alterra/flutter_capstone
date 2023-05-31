import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SourceColor().white,
      appBar: AppBar(
        backgroundColor: SourceColor().white,
        elevation: 0,
        title: Text(
          "Profile",
          style: setTextStyle(NeutralColor().neutral12).copyWith(
            fontWeight: regular,
            fontSize: 16,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            SizedBox(
              height: 175,
              width: double.infinity,
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: SecondaryColor().secondaryFixedDim,
                      radius: 44,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        minimumSize: const Size(140, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: BorderSide(
                            color: SourceColor().seed,
                            width: 1,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Change Photo",
                        style: setTextStyle(PrimaryColor().primary).copyWith(
                          fontWeight: regular,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
