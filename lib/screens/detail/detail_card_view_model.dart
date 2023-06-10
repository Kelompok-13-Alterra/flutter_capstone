import 'package:flutter/material.dart';

class DetailCardViewModel extends ChangeNotifier {
  //Detail Card
  DateTime now = DateTime.now();
  bool isOpen = false;
  void checkOpeningStatus(String open, String close) {
    if (now.isAfter(
          formatRangeIsOpen(open),
        ) &&
        now.isBefore(
          formatRangeIsOpen(close),
        )) {
      isOpen = true;
      notifyListeners();
    } else {
      isOpen = false;
      notifyListeners();
    }
  }

  DateTime formatRangeIsOpen(String value) {
    List<String> timeParts = value.split(':');
    int valueHour = int.parse(timeParts[0]);
    int valueMinute = int.parse(timeParts[1]);
    int valueSecond = int.parse(timeParts[2]);
    return DateTime(
      now.year,
      now.month,
      now.day,
      valueHour,
      valueMinute,
      valueSecond,
      now.millisecond,
    );
  }
}
