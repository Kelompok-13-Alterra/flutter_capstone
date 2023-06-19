// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

String dataRescheduleConvert(String data) {
  DateTime dateTime = DateTime.parse(data);
  int year = dateTime.year;
  String month = dateTime.month.toString().padLeft(2, '0');
  String day = dateTime.day.toString().padLeft(2, '0');
  return '$year-$month-$day';
}
