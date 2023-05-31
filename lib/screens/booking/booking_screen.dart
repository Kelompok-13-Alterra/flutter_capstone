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
              colorScheme: ColorScheme.dark(
                surface: SourceColor().white,
                primary: PrimaryColor().primary,
                onPrimary: SourceColor().white,
                onSurface: NeutralColor().neutral0,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: NeutralColor().neutral0, // button text color
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
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance
        .addPostFrameCallback((_) => selectDateRange(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
