// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/detail/widget/bottom_book.dart';
import 'package:flutter_capstone/screens/detail/widget/detail_card.dart';
import 'package:flutter_capstone/screens/detail/widget/fasilities.dart';
import 'package:flutter_capstone/screens/detail/widget/image_detail.dart';
import 'package:flutter_capstone/screens/detail/widget/office_description.dart';

class DetailScreen extends StatefulWidget {
  final String? buttonRoute;
  final String textButton;
  final int? officeId;
  const DetailScreen({
    super.key,
    required this.buttonRoute,
    required this.textButton,
    this.officeId,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    // var detailViewModel = Provider.of<DetailViewModel>(context);
    print('Passed officeId ${widget.officeId}');
    return

        // WillPopScope(
        //   onWillPop: () async {
        //     if (widget.textButton == 'Pilih Metode Pembayaran') {
        //       Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => DetailScreen(
        //             officeId: widget.officeId,
        //             buttonRoute: '/booking',
        //             textButton: 'Book',
        //           ),
        //         ),
        //       );
        //     } else if (widget.textButton == 'Book') {
        //       Navigator.pushReplacementNamed(context, '/bottom-nav',
        //           arguments: widget.officeId);
        //     }
        //     return true;
        //   },
        // child:
        Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Image Swipe
            //================================================================
            const ImageDetail(),
            // Container Detail
            //================================================================
            const DetailCard(),
            // Container Fasilitas
            //================================================================
            const OfficeFalicities(),
            // Container Deskripsi
            //================================================================
            const OfficeDescription(),
            // Button Book
            //================================================================
            BottomBook(
              function: null,
              officeId: widget.officeId,
              buttonRoute: widget.buttonRoute,
              textButton: widget.textButton,
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
