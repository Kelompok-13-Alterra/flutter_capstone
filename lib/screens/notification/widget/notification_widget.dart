import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/notification/notification_model.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

Widget notificationWidget(BuildContext context, {required Datum notification}) {
  Widget child() {
    if (notification.status == 'success') {
      return Image.asset('assets/images/notification/success.png');
    } else if (notification.status == 'processing') {
      return Image.asset('assets/images/notification/process.png');
    } else if (notification.status == 'firstorder') {
      return Image.asset('assets/images/notification/first_order.png');
    } else if (notification.status == 'welcome') {
      return Image.asset('assets/images/notification/welcome.png');
    } else {
      return Container();
    }
  }

  return SizedBox(
    height: 124,
    child: Card(
      color: const Color(0xFFFAF9FD),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // clipBehavior: Clip.none,
          children: [
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Html(data: notification.description, style: {
                    "p": Style(
                      fontSize: FontSize.large,
                      fontWeight: regular,
                    ),
                    "b": Style(
                      fontWeight: bold,
                    ),
                  }),

                  //Date
                  Padding(
                    padding: const EdgeInsets.only(left: 7.0),
                    child: Text(notification.createdAt.toString(),
                        textAlign: TextAlign.end,
                        style: setTextStyle(NeutralColor().neutral50)
                            .copyWith(fontSize: 12, fontWeight: regular)

                        // TextStyle(fontSize: 15, color: Colors.white),
                        ),
                  ),
                ],
              ),
            ),

            Flexible(
              flex: 1,
              child: SizedBox(
                width: 70,
                height: 60.07,
                child: child(),
              ),
            ),

            //Picture
          ],
        ),
      ),
    ),
  );
}
