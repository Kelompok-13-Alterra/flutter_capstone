import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

class BookingScheduleArgument {
  final int officeId;

  BookingScheduleArgument({required this.officeId});
}

class BookingScheduleScreen extends StatefulWidget {
  const BookingScheduleScreen({super.key});

  @override
  State<BookingScheduleScreen> createState() => _BookingScheduleScreenState();
}

class _BookingScheduleScreenState extends State<BookingScheduleScreen> {
  DateTimeRange? selectedDateRange;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _selectDateRange(context);
    });
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final pickedDateRange = await showDateRangePicker(
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
      // locale: const Locale('ind', 'id'),
      helpText: 'Start - End Date',
      cancelText: 'CANCEL',
      confirmText: 'OK',
      saveText: 'SAVE',
      errorFormatText: 'Invalid format.',
      errorInvalidText: 'Out of range.',
      errorInvalidRangeText: 'Invalid range.',
      fieldStartHintText: 'Start Date',
      fieldEndLabelText: 'End Date',
    );

    if (pickedDateRange != null) {
      setState(() {
        selectedDateRange = pickedDateRange;
        Navigator.pop(context, selectedDateRange);
      });

      //   // ignore: use_build_context_synchronously
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => DetailScreen(
      //         index: args.officeId,
      //         buttonRoute: null,
      //         textButton: 'Pilih Metode Pembayaran',
      //       ),
      //     ),
      //   );
    }
    //else {
    //   // ignore: use_build_context_synchronously
    //   Navigator.pop(context);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(), // Tampilkan loading indicator
        ),
      ),
    );
  }
}
