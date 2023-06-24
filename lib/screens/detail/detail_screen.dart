// ignore_for_file: file_names

import 'package:flutter/material.dart';
// import 'package:flutter_capstone/model/detail/detail_model.dart';
import 'package:flutter_capstone/screens/detail/widget/bottom_book.dart';
import 'package:flutter_capstone/screens/detail/widget/detail_card.dart';
import 'package:flutter_capstone/screens/detail/widget/fasilities.dart';
import 'package:flutter_capstone/screens/detail/widget/image_detail.dart';
import 'package:flutter_capstone/screens/detail/widget/office_description.dart';
import 'package:flutter_capstone/screens/errors/connection_error.dart';
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

  DetailScreen({
    super.key,
    this.buttonRoute,
    required this.textButton,
    required this.officeId,
    this.selectedDateRange,
    this.idTransaction,
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
                textButton: 'Book',
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
      child:
          // final detailViewModel = Provider.of<DetailViewModel>(context);
          // final dataOffice = detailViewModel.detailData;
          // return
          Scaffold(
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
                        image: detail!.imageUrl.isEmpty || detail.imageUrl == ''
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
                      OfficeDescription(
                        description: detail.description,
                      ),
                      // Button Book
                      //================================================================
                      BottomBook(
                        function: null,
                        officeId: widget.officeId,
                        buttonRoute: widget.buttonRoute,
                        textButton: widget.textButton,
                        image: detail.imageUrl,
                        selectedDateRange: widget.selectedDateRange,
                        price: detail.price,
                        name: detail.name,
                        type: detail.type,
                        location: detail.location,
                        // location: detail.location,
                        // open: detail.open,
                        // close: detail.close,
                      ),
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
    // final detailViewModel = Provider.of<DetailViewModel>(context);
    // final dataOffice = detailViewModel.detailData;
  }
}
