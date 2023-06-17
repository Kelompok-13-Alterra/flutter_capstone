import 'package:intl/intl.dart';

String dataRescheduleConvert(String data) {
  DateTime dateTime = DateTime.parse(data);
  int year = dateTime.year;
  int month = dateTime.month;
  int day = dateTime.day;
  return '$year-$month-$day';
}
