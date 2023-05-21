import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

class BookingScheduleScreen extends StatefulWidget {
  const BookingScheduleScreen({super.key});

  @override
  State<BookingScheduleScreen> createState() => _BookingScheduleScreenState();
}

Future selectDateRange(BuildContext context) async {
  DateTimeRange? pickedRange = await showDateRangePicker(
      context: context,
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: kWhiteColor,
                onPrimary: kBlackColor,
                onSurface: kBlackColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: kBlackColor, // button text color
                ),
              ),
            ),
            child: child!);
      },
      initialDateRange: DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now(),
      ),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
      helpText: 'Start - End Date',
      cancelText: 'CANCEL',
      confirmText: 'OK',
      saveText: 'SAVE',
      errorFormatText: 'Invalid format.',
      errorInvalidText: 'Out of range.',
      errorInvalidRangeText: 'Invalid range.',
      fieldStartHintText: 'Start Date',
      fieldEndLabelText: 'End Date');

  if (pickedRange != null) {
    // ignore: avoid_print
    print(
        'picked range ${pickedRange.start} ${pickedRange.end} ${pickedRange.duration.inDays}');
  }
}

class _BookingScheduleScreenState extends State<BookingScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ElevatedButton(
        onPressed: () {
          selectDateRange(context);
        },
        child: const Text('select range'),
      ),
    );
  }
}
