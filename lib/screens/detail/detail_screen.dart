// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/detail/widget/bottom_book.dart';
import 'package:flutter_capstone/screens/detail/widget/detail_card.dart';
import 'package:flutter_capstone/screens/detail/widget/fasilities.dart';
import 'package:flutter_capstone/screens/detail/widget/image_detail.dart';
import 'package:flutter_capstone/screens/detail/widget/office_description.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
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
              buttonRoute: null,
              textButton: 'Book',
            ),
          ],
        ),
      ),
    );
  }
}
