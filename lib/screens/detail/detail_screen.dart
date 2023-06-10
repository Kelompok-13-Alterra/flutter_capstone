// ignore_for_file: file_names

// import 'dart:js_interop';

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

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

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
      final arguments = ModalRoute.of(context)?.settings.arguments;
      int idDataDetail = arguments as int;
      final data = detailViewModel.getOfficeDetail(idDataDetail);
      completer.complete(data);
    });
    detailDataFuture = completer.future;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final detailViewModel = Provider.of<DetailViewModel>(context);
    // final dataOffice = detailViewModel.detailData;
    return Scaffold(
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
                    const ImageDetail(),
                    // Container Detail
                    //================================================================
                    DetailCard(
                      name: detail!.name,
                      price: detail.price,
                      open: detail.open,
                      close: detail.close,
                      capacity: detail.capacity,
                      location: detail.location,
                    ),
                    // Container Fasilitas
                    //================================================================
                    OfficeFalicities(),
                    // Container Deskripsi
                    //================================================================
                    OfficeDescription(
                      description: detail.description,
                    ),
                    // Button Book
                    //================================================================
                    BottomBook(
                      buttonRoute: null,
                      textButton: 'Book',
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
    );
  }
}
