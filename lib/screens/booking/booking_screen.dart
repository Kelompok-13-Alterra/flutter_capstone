import 'package:flutter/material.dart';
import 'package:flutter_capstone/core/init/utils/date_convert.dart';
import 'package:flutter_capstone/screens/detail/detail_screen.dart';
import 'package:flutter_capstone/screens/payment/detail_payment_screen.dart';
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
  // @override
  // void setState(fn) {
  //   if (mounted) {
  //     super.setState(fn);
  //   }
  // }

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
    print('Office id in booking screen ${args.officeId}');

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
      // ignore: use_build_context_synchronously
      var res = await BookingAvailabilityService().checkDate(
        context,
        // officeId: 0, startDate: "2023-06-12", endDate: "2023-06-14"
        officeId: args.officeId,
        startDate: convertDateTime(pickedDateRange.start.toString()),
        endDate: convertDateTime(pickedDateRange.end.toString()),
      );
      var getStatus = res.meta.code;
      if (getStatus == 201) {
        // ignore: use_build_context_synchronously
        ModalBottomSheet(context,
            img: 'assets/images/modal_bottom/retro_mac.png',
            title: 'All set!',
            desc: 'Tanggal yang kamu pilih tersedia!', path: () {
          setState(() {
            selectedDateRange = pickedDateRange;
          });
          Navigator.pop(context);

          print('Move to detail screen ${selectedDateRange}');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                officeId: args.officeId,
                buttonRoute: '/booking',
                textButton: 'Pilih metode pembayaran',
                selectedDateRange: selectedDateRange,
              ),
            ),
          );
          // Navigator.pop(context, selectedDateRange);
        }, buttonText: 'Selanjutnya');
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

// FutureBuilder(
    //   future: BookingAvailabilityService().checkDate(
    //     officeId: args.officeId,
    //     startDate: convertDateTime(selectedDateRange!.start.toString()),
    //     endDate: convertDateTime(selectedDateRange!.end.toString()),
    //   ),
    //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    //     if (snapshot.hasData) {
    //       print(
    //           'Start date in booking screen ${convertDateTime(selectedDateRange!.start.toString())}');
    //       // if (pickedDateRange != null) {
    //       return ModalBottomSheet(context,
    //           img: 'assets/images/modal_bottom/retro_mac.png',
    //           title: 'All set!',
    //           desc: 'Tanggal yang kamu pilih tersedia!', path: () {
    //         // DetailPaymentScreen(paymentId: snapshot.data!);
    //         setState(() {
    //           selectedDateRange = pickedDateRange;
    //           Navigator.pop(context, selectedDateRange);
    //         });
    //       }, buttonText: 'Selanjutnya');
    //     } else {
    //       return ModalBottomSheet(context,
    //           img: 'assets/images/modal_bottom/retro_mac_error.png',
    //           title: 'Waduh?!',
    //           desc:
    //               'Tanggal yang kamu pilih tidak tersedia. Coba pilih\ntanggal yang lain.',
    //           path: () {
    //         const BookingScheduleScreen();
    //       }, buttonText: 'Selanjutnya');
    //     }
    //   },
    // );
    // if (pickedDateRange != null) {

    //   setState(() {
    //     selectedDateRange = pickedDateRange;
    //     Navigator.pop(context, selectedDateRange);
    //   });
    //   //   // ignore: use_build_context_synchronously
    //   //   Navigator.pushReplacement(
    //   //     context,
    //   //     MaterialPageRoute(
    //   //       builder: (context) => DetailScreen(
    //   //         index: args.officeId,
    //   //         buttonRoute: null,
    //   //         textButton: 'Pilih Metode Pembayaran',
    //   //       ),
    //   //     ),
    //   //   );