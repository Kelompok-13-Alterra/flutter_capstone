import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

class EmptyNotificationScreen extends StatelessWidget {
  const EmptyNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        title: Padding(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: Text(
                  "Notification",
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: regular),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  bottom: 20,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Mark all as read",
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: semiBold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/Empty(general).png",
              height: 137,
              width: 119.77,
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              "Masih Kosong Nih",
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: regular),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Yuk, pesan kantor atau co-working",
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: regular),
            ),
            Text(
              "space kamu sekarang",
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: regular),
            ),
            const SizedBox(
              height: 11,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF005DB9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 50.5,
                  right: 50.5,
                ),
                child: Text(
                  "Start Booking",
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
