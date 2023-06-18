import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/notification/all_notification_screen.dart';
import 'package:flutter_capstone/screens/notification/booked_notification_screen.dart';
import 'package:flutter_capstone/style/text_style.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Tab> notifTab = [
    const Tab(
      text: "All",
    ),
    const Tab(
      text: "Booking",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: notifTab.length,
      child: Scaffold(
        backgroundColor: SourceColor().white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: SourceColor().white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
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
                    style: setTextStyle(NeutralColor().neutral12).copyWith(
                      fontSize: 16,
                      fontWeight: regular,
                    ),
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
                      style: setTextStyle(KeyColor().primary).copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              indicatorWeight: 3,
              indicatorColor: const Color(0xFF005DB9),
              labelColor: const Color(0xFF5E5E62),
              unselectedLabelColor: const Color(0xFF666666),
              labelStyle: setTextStyle(NeutralColor().neutral10)
                  .copyWith(fontSize: 14, fontWeight: semiBold),
              unselectedLabelStyle: setTextStyle(NeutralColor().neutral10)
                  .copyWith(fontSize: 14, fontWeight: semiBold),
              tabs: notifTab,
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  AllNotificationScreen(),
                  BookedNotificationScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
