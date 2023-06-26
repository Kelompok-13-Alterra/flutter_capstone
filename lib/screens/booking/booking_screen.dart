// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_capstone/core/init/utils/date_convert.dart';
import 'package:flutter_capstone/screens/detail/detail_screen.dart';
import 'package:flutter_capstone/services/booking/booking_availability_service.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/widgets/modal_bottom.dart';

class BookingScheduleArgument {
  final int officeId;
  final DateTimeRange? selectedDateRange;

  BookingScheduleArgument({required this.officeId, this.selectedDateRange});
}

class BookingScheduleScreen extends StatefulWidget {
  const BookingScheduleScreen({super.key});

  @override
  State<BookingScheduleScreen> createState() => _BookingScheduleScreenState();
}

class _BookingScheduleScreenState extends State<BookingScheduleScreen> {
  int? officeId;
  DateTimeRange? selectedDateRange;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _selectDateRange(context);
    });
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final args =
        ModalRoute.of(context)?.settings.arguments as BookingScheduleArgument;

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
                  foregroundColor: NeutralColor().neutral0,
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
      fieldEndLabelText: 'End Date',
    );

    if (pickedDateRange != null) {
      var res = await BookingAvailabilityService().checkDate(
        context,
        officeId: args.officeId,
        startDate: convertDateTime(pickedDateRange.start.toString()),
        endDate: convertDateTime(pickedDateRange.end.toString()),
      );
      var getStatus = res?.meta.code;
      if (getStatus == 201) {
        modalBottomSheet(context,
            img: 'assets/images/modal_bottom/retro_mac.png',
            title: 'All set!',
            desc: 'Tanggal yang kamu pilih tersedia!', path: () {
          setState(() {
            selectedDateRange = pickedDateRange;
          });
          Navigator.pop(context, selectedDateRange);
        }, buttonText: 'Selanjutnya');
      }
      if (getStatus == 500) {
        return modalBottomSheet(context,
            img: 'assets/images/modal_bottom/retro_mac_error.png',
            title: 'Waduh?!',
            desc: 'Gagal mengumpulkan informasi! Silahkan coba lagi', path: () {
          Navigator.pushReplacementNamed(
            context,
            '/bottom-nav',
          );
        }, buttonText: 'Pilih tanggal lain');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as BookingScheduleArgument;
    return DetailScreen(
      officeId: args.officeId,
      buttonRoute: '/booking',
      textButton: 'Pilih metode pembayaran',
      selectedDateRange: selectedDateRange,
    );
  }
}
