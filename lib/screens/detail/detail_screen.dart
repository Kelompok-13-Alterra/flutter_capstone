// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/detail/widget/bottom_book.dart';
import 'package:flutter_capstone/screens/detail/widget/detail_card.dart';
import 'package:flutter_capstone/screens/detail/widget/fasilities.dart';
import 'package:flutter_capstone/screens/detail/widget/form_booking.dart';
import 'package:flutter_capstone/screens/detail/widget/image_detail.dart';
import 'package:flutter_capstone/screens/detail/widget/office_description.dart';
import 'package:flutter_capstone/screens/errors/connection_error.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_capstone/screens/detail/detail_view_model.dart';
import 'dart:async';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  final String? buttonRoute;
  final String textButton;
  final int officeId;
  final DateTimeRange? selectedDateRange;
  int? idTransaction;
  double? rating;

  DetailScreen({
    super.key,
    this.buttonRoute,
    required this.textButton,
    required this.officeId,
    this.selectedDateRange,
    this.idTransaction,
    this.rating,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<dynamic> detailDataFuture;
  @override
  void initState() {
    final completer = Completer<dynamic>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final detailViewModel =
          Provider.of<DetailViewModel>(context, listen: false);
      final data = detailViewModel.getOfficeDetail(widget.officeId);
      completer.complete(data);
      completer.future.then((data) {
        final detailViewModel =
            Provider.of<DetailViewModel>(context, listen: false);
        detailViewModel.checkOpeningStatus(detailViewModel.detailData!.open,
            detailViewModel.detailData!.close);
      });
    });
    detailDataFuture = completer.future;
    super.initState();
  }

  bool isBookingFormVisible = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        if (widget.textButton == 'Pilih metode pembayaran') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                officeId: widget.officeId,
                buttonRoute: '/booking',
                textButton: 'Booking via Aplication',
              ),
            ),
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/bottom-nav',
            (route) => false,
          );
        }
        return true;
      },
      child: Scaffold(
        body: Consumer<DetailViewModel>(builder: (context, provider, _) {
          return FutureBuilder(
            future: detailDataFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final detail = provider.detailData;

                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      // Image Swipe
                      //================================================================
                      ImageDetail(
                        image: detail?.imageUrl ?? '',
                      ),
                      // Container Detail
                      //================================================================
                      DetailCard(
                        name: detail?.name ?? 'Untrack Office',
                        rating: widget.rating ?? 0,
                        price: detail?.price ?? 0,
                        open: detail?.open ?? '',
                        close: detail?.close ?? '',
                        capacity: detail?.capacity ?? 0,
                        location: detail?.location ?? 'Untrack Location',
                      ),
                      // Container Fasilitas
                      //================================================================
                      const OfficeFalicities(),
                      // Container Deskripsi
                      //================================================================
                      OfficeDescription(
                        description: detail?.description ?? '',
                      ),
                      widget.textButton == 'Booking via Aplication'
                          ? Padding(
                              padding: isBookingFormVisible
                                  ? const EdgeInsets.all(16)
                                  : const EdgeInsets.fromLTRB(16, 16, 16, 0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all(0),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            Colors.white,
                                          ),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              side: BorderSide(
                                                  color: PrimaryColor().primary,
                                                  width: 2.0),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(
                                            () {
                                              isBookingFormVisible =
                                                  !isBookingFormVisible;
                                            },
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Bookng via Form',
                                                style: setTextStyle(
                                                        SourceColor().black)
                                                    .copyWith(
                                                        fontWeight: bold,
                                                        fontSize: 10),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              isBookingFormVisible
                                                  ? SvgPicture.asset(
                                                      "assets/icons/detail/up.svg")
                                                  : SvgPicture.asset(
                                                      "assets/icons/detail/down.svg"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  isBookingFormVisible
                                      ? const SizedBox(
                                          height: 16,
                                        )
                                      : Container(),
                                  isBookingFormVisible
                                      ? FormBoooking(
                                          nameOffice:
                                              detail?.name ?? 'Untrack Office',
                                          officeId: widget.officeId,
                                          imageUrl: detail?.imageUrl ?? '',
                                        )
                                      : Container()
                                ],
                              ),
                            )
                          : Container(),
                      // Button Book via Aplication
                      //================================================================
                      !isBookingFormVisible
                          ? BottomBook(
                              function: null,
                              officeId: widget.officeId,
                              buttonRoute: widget.buttonRoute,
                              textButton: widget.textButton,
                              image: detail?.imageUrl ?? '',
                              selectedDateRange: widget.selectedDateRange,
                              price: detail?.price ?? 0,
                              name: detail?.name ?? 'Untrack Office',
                              type: detail?.type,
                              location: detail?.location ?? '',
                            )
                          : Container(),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return const ConnectionErrorScreen();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        }),
      ),
    );
  }
}
