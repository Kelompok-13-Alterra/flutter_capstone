import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/notification/notification_view_model.dart';
import 'package:flutter_capstone/screens/notification/widget/notification_widget.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:provider/provider.dart';

class BookedNotificationScreen extends StatefulWidget {
  const BookedNotificationScreen({super.key});

  @override
  State<BookedNotificationScreen> createState() =>
      _BookedNotificationScreenState();
}

class _BookedNotificationScreenState extends State<BookedNotificationScreen> {
  Future? notificationViewModel;
  @override
  void initState() {
    notificationViewModel =
        Provider.of<NotificationViewModel>(context, listen: false)
            .getNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationViewModel>(
      builder: (context, notification, child) {
        return FutureBuilder(
          future: notificationViewModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: notification.getNotificationModel.data?.length,
                      itemBuilder: (context, index) {
                        if (notification
                                .getNotificationModel.data![index].status ==
                            'success') {
                          return notificationWidget(context,
                              notification: notification
                                  .getNotificationModel.data![index]);
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: PrimaryColor().primary,
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
