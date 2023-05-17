import 'package:flutter/material.dart';
import 'package:notification_feature/style/text_style.dart';

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
                  style: NotificationTitle().text9,
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
                    style: MarkAllAsRead().text10,
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
              style: EmptyDesc().text15,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Yuk, pesan kantor atau co-working",
              style: SubEmptyDesc().text16,
            ),
            Text(
              "space kamu sekarang",
              style: SubEmptyDesc().text16,
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
                  style: TextButtonBooking().text17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
