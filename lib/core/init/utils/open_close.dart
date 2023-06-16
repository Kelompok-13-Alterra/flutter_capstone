import 'package:flutter/material.dart';

bool isOpen = false;
bool checkOpeningStatus(String open, String close) {
  DateTime now = DateTime.now();
  if (now.isAfter(
        formatRangeIsOpen(open),
      ) &&
      now.isBefore(
        formatRangeIsOpen(close),
      )) {
    return true;
  } else {
    return false;
  }
}

DateTime formatRangeIsOpen(String value) {
  DateTime now = DateTime.now();
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
