// ignore_for_file: file_names
//Ini utk reschedule
import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/detail/widget/bottom_book.dart';
import 'package:flutter_capstone/screens/detail/widget/detail_card.dart';
import 'package:flutter_capstone/screens/detail/widget/fasilities.dart';
import 'package:flutter_capstone/screens/detail/widget/image_detail.dart';
import 'package:flutter_capstone/screens/detail/widget/office_description.dart';
import 'package:flutter_capstone/style/text_style.dart';

class DetailScheduleScreen extends StatefulWidget {
  const DetailScheduleScreen({super.key});

  @override
  State<DetailScheduleScreen> createState() => _DetailScheduleScreenState();
}

class _DetailScheduleScreenState extends State<DetailScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Image Swipe
            //================================================================
            ImageDetail(),
            // Container Detail
            //================================================================
            const DetailCard(
              name: "Athena Office",
              price: 150000,
              open: "07:00:00",
              close: "21:00:00",
              capacity: 20,
              location: "Jakarta",
            ),
            // Container Fasilitas
            //================================================================
            const OfficeFalicities(),
            // Container Deskripsi
            //================================================================
            const OfficeDescription(description: "Lorem Ipsum Dolor sit amet"),
            // Button Book
            //================================================================
            BottomBook(
              officeId: 0,
              function: () async {
                // Future selectDateRange(BuildContext context) async {
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
                                foregroundColor: NeutralColor()
                                    .neutral0, // button text color
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
                  // ignore: use_build_context_synchronously
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: FractionallySizedBox(
                            heightFactor: 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 127.5,
                                  height: 130,
                                  child: Image.asset(
                                      'assets/images/modal_bottom/retro_mac.png'),
                                ),
                                const Padding(padding: EdgeInsets.only(top: 8)),
                                Text(
                                  'All Set!!!',
                                  style: setTextStyle(NeutralColor().neutral17)
                                      .copyWith(
                                          fontSize: 16, fontWeight: semiBold),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 6, bottom: 16),
                                  child: Text(
                                    'Tanggal yang kamu pilih sudah terjadwal\npemesanan!!!',
                                    textAlign: TextAlign.center,
                                    style:
                                        setTextStyle(NeutralColor().neutral17)
                                            .copyWith(
                                      fontSize: 12,
                                      fontWeight: regular,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          '/bottom-nav', (route) => false);
                                    },
                                    style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              PrimaryColor().primary),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              100), // Bentuk border
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'Checkout',
                                      style:
                                          setTextStyle(PrimaryColor().onPrimary)
                                              .copyWith(
                                        fontSize: 14,
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });

                  // ignore: avoid_print
                  print(
                      'picked range ${pickedRange.start} ${pickedRange.end} ${pickedRange.duration.inDays}');
                }
                // }
              },
              textButton: 'Reschedule',
              buttonRoute: null,
            ),
          ],
        ),
      ),
    );
  }
}
