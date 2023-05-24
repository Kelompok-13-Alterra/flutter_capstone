import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/screens/notification/card_all_booking_notification_widget.dart';
import 'package:flutter_capstone/screens/notification/card_booking_notification_widget.dart';

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
                    style: setTextStyle(NeutralColor().neutral12)
                        .copyWith(fontSize: 16, fontWeight: regular),
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
                      style: setTextStyle(KeyColor().primary)
                          .copyWith(fontSize: 14, fontWeight: semiBold),
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
              labelStyle: setTextStyle(NeutralColor().neutral12)
                  .copyWith(fontSize: 14, fontWeight: semiBold),
              unselectedLabelStyle: setTextStyle(NeutralColor().neutral12)
                  .copyWith(fontSize: 14, fontWeight: semiBold),
              tabs: notifTab,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    child: cardAllBookingNotificationWidget(context),
                  ),
                  Container(
                    color: Colors.white,
                    child: cardBookingNotificationWidget(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     backgroundColor: const Color(0xFFFFFFFF),
    //     title: Padding(
    //       padding: const EdgeInsets.only(
    //         top: 16,
    //       ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text(
    //             "Notification",
    //             style: NotificationTitle().text9,
    //           ),
    //           Text(
    //             "Mark all as read",
    //             style: MarkAllAsRead().text10,
    //           ),
    //         ],
    //       ),
    //     ),
    //     bottom: PreferredSize(
    //       preferredSize: const Size.fromHeight(56),
    //       child: DefaultTabController(
    //         length: notifTab.length,
    //         child: TabBar(
    //           indicatorWeight: 3,
    //           indicatorColor: const Color(0xFF005DB9),
    //           labelStyle: TabLabelStyle().text11,
    //           unselectedLabelStyle: UnselectTabLabelStyle().text12,
    //           tabs: notifTab,
    //         ),
    //       ),
    //     ),
    //   ),
    // body: TabBarView(
    //   children: [
    //     Container(
    //       child: Text("1"),
    //       color: Colors.blueGrey,
    //     ),
    //     Container(
    //       child: Text("2"),
    //       color: Colors.greenAccent,
    //     ),
    //   ],
    // ),
    // );
/*
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(108),
          child: DefaultTabController(
            length: 2,
            child: TabBar(
              labelColor: Color(0xFF5E5E62),
              tabs: [
                Tab(
                  text: "All",
                ),
                Tab(
                  text: "Booking",
                ),
              ],
            ),
          ),
        ),
 */
