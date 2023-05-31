// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/detail/widget/bottom-book.dart';
import 'package:flutter_capstone/screens/detail/widget/detai_card.dart';
import 'package:flutter_capstone/screens/detail/widget/fasilities.dart';
import 'package:flutter_capstone/screens/detail/widget/image-detail.dart';
import 'package:flutter_capstone/screens/detail/widget/office_description.dart';
import 'package:flutter_capstone/style/text_style.dart';

class DetailScheduleScreen extends StatefulWidget {
  const DetailScheduleScreen({super.key});

  @override
  State<DetailScheduleScreen> createState() => _DetailScheduleScreenState();
}

class _DetailScheduleScreenState extends State<DetailScheduleScreen> {
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
                    foregroundColor:
                        NeutralColor().neutral0, // button text color
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

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Image Swipe
            //================================================================
            ImageDetail(),
            // Container Detail
            //================================================================
            DetailCard(),
            // Container Fasilitas
            //================================================================
            OfficeFalicities(),
            // Container Deskripsi
            //================================================================
            OfficeDescription(),
            // Button Book
            //================================================================
            BottomBook(
              buttonRoute: '/booking',
              textButton: 'Reschedule',
            ),
          ],
        ),
      ),
    );
  }
}
