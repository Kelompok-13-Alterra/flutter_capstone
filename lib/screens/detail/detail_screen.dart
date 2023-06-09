// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/detail/widget/bottom_book.dart';
import 'package:flutter_capstone/screens/detail/widget/detail_card.dart';
import 'package:flutter_capstone/screens/detail/widget/fasilities.dart';
import 'package:flutter_capstone/screens/detail/widget/image_detail.dart';
import 'package:flutter_capstone/screens/detail/widget/office_description.dart';

class DetailScreen extends StatefulWidget {
  final String? buttonRoute;
  final String textButton;
  const DetailScreen({
    super.key,
    required this.buttonRoute,
    required this.textButton,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.textButton == 'Pilih Metode Pembayaran') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailScreen(
                buttonRoute: '/booking',
                textButton: 'Book',
              ),
            ),
          );
        } else if (widget.textButton == 'Book') {
          Navigator.pushReplacementNamed(context, '/bottom-nav');
        }
        return true;
      },
      child: Scaffold(
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
                buttonRoute: widget.buttonRoute,
                textButton: widget.textButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
