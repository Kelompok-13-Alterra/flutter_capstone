import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_html/flutter_html.dart';

Widget cardAllBookingNotificationWidget(BuildContext context) {
  return Column(
    children: [
      Html(
          data: "<p>My normal text <b>with bold part</b> in any place</p>",
          style: {
            "p": Style(fontSize: FontSize.large, fontWeight: FontWeight.normal),
            "b": Style(
              fontWeight: FontWeight.bold,
            ),
          }),
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
                        style: setTextStyle(NeutralColor().neutral12)
                            .copyWith(fontSize: 14, fontWeight: regular),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Pesanan ",
                        style: setTextStyle(NeutralColor().neutral12)
                            .copyWith(fontSize: 16, fontWeight: regular),
                        children: <TextSpan>[
                          TextSpan(
                            text: "#ID20230506 ",
                            style: setTextStyle(NeutralColor().neutral12)
                                .copyWith(fontSize: 14, fontWeight: bold),
                          ),
                          TextSpan(
                            text: "Berhasil",
                            style: setTextStyle(NeutralColor().neutral12)
                                .copyWith(fontSize: 16, fontWeight: regular),
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
                  "assets/images/notification/success.png",
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
                        style: setTextStyle(NeutralColor().neutral12)
                            .copyWith(fontSize: 16, fontWeight: regular),
                        children: <TextSpan>[
                          TextSpan(
                            text: "sedang diproses",
                            style: setTextStyle(NeutralColor().neutral12)
                                .copyWith(fontSize: 16, fontWeight: bold),
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
                  "assets/images/notification/process.png",
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
                  top: 14,
                  bottom: 14,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Mulai lakukan ",
                        style: setTextStyle(NeutralColor().neutral12)
                            .copyWith(fontSize: 16, fontWeight: regular),
                        children: <TextSpan>[
                          TextSpan(
                            text: "pemesanan kantor ",
                            style: setTextStyle(NeutralColor().neutral12)
                                .copyWith(fontSize: 16, fontWeight: bold),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "atau co-working space ",
                        style: setTextStyle(NeutralColor().neutral12)
                            .copyWith(fontSize: 16, fontWeight: regular),
                        children: <TextSpan>[
                          TextSpan(
                            text: "pertama ",
                            style: setTextStyle(NeutralColor().neutral12)
                                .copyWith(fontSize: 16, fontWeight: bold),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "kamu!",
                        style: setTextStyle(NeutralColor().neutral12).copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
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
                  "assets/images/notification/first_order.png",
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
                  // bottom: 14,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Selamat Datang di ",
                        style: setTextStyle(NeutralColor().neutral12)
                            .copyWith(fontSize: 16, fontWeight: regular),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Office Buddy",
                            style: setTextStyle(NeutralColor().neutral12)
                                .copyWith(fontSize: 16, fontWeight: bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text("Jan 21, 2023 at 09:00 AM"),
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
                  "assets/images/notification/welcome.png",
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
