import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

ModalBottomSheet(
  BuildContext context, {
  required String img,
  required String title,
  required String desc,
  required Function() path,
  required String buttonText,
}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(15),
      )),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: FractionallySizedBox(
            heightFactor: 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 127.5,
                  height: 130,
                  child: Image.asset(img),
                ),
                const Padding(padding: EdgeInsets.only(top: 8)),
                Text(
                  title,
                  style: setTextStyle(NeutralColor().neutral17)
                      .copyWith(fontSize: 16, fontWeight: semiBold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 16),
                  child: Text(
                    desc,
                    textAlign: TextAlign.center,
                    style: setTextStyle(NeutralColor().neutral17).copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: path,
                    // () {
                    //   Navigator.pushNamedAndRemoveUntil(
                    //       context, '/bottom-nav', (route) => false);
                    // },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStateProperty.all(PrimaryColor().primary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(100), // Bentuk border
                        ),
                      ),
                    ),
                    child: Text(
                      buttonText,
                      style: setTextStyle(PrimaryColor().onPrimary).copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}
