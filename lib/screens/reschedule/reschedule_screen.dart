// ignore_for_file: file_names, avoid_print, duplicate_ignore
//Ini utk reschedule
import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/detail/widget/bottom_book.dart';
import 'package:flutter_capstone/screens/detail/widget/detail_card.dart';
import 'package:flutter_capstone/screens/detail/widget/fasilities.dart';
import 'package:flutter_capstone/screens/detail/widget/image_detail.dart';
import 'package:flutter_capstone/screens/detail/widget/office_description.dart';
import 'package:flutter_capstone/screens/errors/connection_error.dart';
import 'package:flutter_capstone/screens/reschedule/reschedule_view_model.dart';
import 'package:flutter_capstone/screens/detail/detail_view_model.dart';
import 'package:flutter_capstone/core/init/utils/date-reschedule.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class RescheduleScreen extends StatefulWidget {
  const RescheduleScreen({super.key});

  @override
  State<RescheduleScreen> createState() => _RescheduleScreenState();
}

class _RescheduleScreenState extends State<RescheduleScreen> {
  late Future<dynamic> detailDataFuture;
  Map<String, int?> args = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (args.isEmpty) {
      args = ModalRoute.of(context)!.settings.arguments as Map<String, int?>;
      final detailViewModel =
          Provider.of<DetailViewModel>(context, listen: false);
      final data = detailViewModel.getOfficeDetail(args['officeId']);

      detailDataFuture = data.then((data) {
        detailViewModel.checkOpeningStatus(detailViewModel.detailData!.open,
            detailViewModel.detailData!.close);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/order-screen',
          (route) => false,
        );

        return true;
      },
      child: Consumer2<RescheduleViewModel, DetailViewModel>(
        builder: (context, provider, provider2, _) {
          return FutureBuilder(
            future: detailDataFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final detail = provider2.detailData;
                return Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        // Image Swipe
                        //================================================================
                        ImageDetail(
                          image: detail!.imageUrl.isEmpty ||
                                  detail.imageUrl == ''
                              ? "https://img.freepik.com/premium-photo/modern-corporate-architecture-can-be-seen-cityscape-office-buildings_410516-276.jpg"
                              : detail.imageUrl,
                        ),
                        // Container Detail
                        //================================================================
                        DetailCard(
                          name: detail.name,
                          rating: detail.rating,
                          price: detail.price,
                          open: detail.open,
                          close: detail.close,
                          capacity: detail.capacity,
                          location: detail.location,
                        ),
                        // Container Fasilitas
                        //================================================================
                        const OfficeFalicities(),
                        // Container Deskripsi
                        //================================================================
                        OfficeDescription(description: detail.description),
                        // Button Book
                        //================================================================
                        BottomBook(
                          image: '',
                          officeId: 0,
                          textButton: 'Reschedule',
                          function: () async {
                            // Future selectDateRange(BuildContext context) async {
                            DateTimeRange? pickedRange =
                                await showDateRangePicker(
                                    context: context,
                                    builder: (context, child) {
                                      return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme: ColorScheme.dark(
                                              surface: SourceColor().white,
                                              primary: PrimaryColor().primary,
                                              onPrimary: SourceColor().white,
                                              onSurface:
                                                  NeutralColor().neutral0,
                                            ),
                                            textButtonTheme:
                                                TextButtonThemeData(
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
                              // ignore: unused_local_variable
                              final statusCode =
                                  // ignore: use_build_context_synchronously
                                  await provider.checkRescheduleOffice(
                                context,
                                args['officeId'],
                                dataRescheduleConvert('${pickedRange.start}'),
                                dataRescheduleConvert('${pickedRange.end}'),
                                args['ID'],
                                pickedRange,
                                true,
                                '',
                              );
                            }
                            // }
                          },
                          buttonRoute: null,
                        ),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return const Scaffold(
                  body: ConnectionErrorScreen(),
                );
              } else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
