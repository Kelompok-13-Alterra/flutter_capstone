//AUTHOR : ULFA LADAYYA
//KELAS C FLUTTER
import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

Widget cardBookingNotificationWidget(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 124,
        child: Card(
          color: const Color(0xFFFAF9FD),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 26,
                  bottom: 26,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Booking Office dengan No",
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Pesanan ",
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular),
                        children: <TextSpan>[
                          TextSpan(
                            text: "#ID20230506 ",
                            style: blackTextStyle.copyWith(
                                fontSize: 14, fontWeight: bold),
                          ),
                          TextSpan(
                            text: "Berhasil",
                            style: blackTextStyle.copyWith(
                                fontSize: 14, fontWeight: regular),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text("Jan 21, 2023 at 10:21 AM"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  top: 31.96,
                  bottom: 31.96,
                ),
                child: Image.asset(
                  "assets/123.png",
                  width: 70,
                  height: 60.07,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 124,
        child: Card(
          color: const Color(0xFFFAF9FD),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 38,
                  // bottom: 38,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Bookingan kamu ",
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: regular),
                        children: <TextSpan>[
                          TextSpan(
                            text: "sedang diproses",
                            style: blackTextStyle.copyWith(
                                fontSize: 14, fontWeight: bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text("Jan 21, 2023 at 10:20 AM"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  top: 31.96,
                  bottom: 31.96,
                ),
                child: Image.asset(
                  "assets/120.png",
                  width: 70,
                  height: 60.07,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
