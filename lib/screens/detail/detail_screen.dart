// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/detail/widget/bottom-book.dart';
import 'package:flutter_capstone/screens/detail/widget/card-detail.dart';
import 'package:flutter_capstone/screens/detail/widget/office_description.dart';
import 'package:flutter_capstone/screens/detail/widget/fasilities.dart';
import 'package:flutter_capstone/screens/detail/widget/image-detail.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
            CardDetail(),
            // Container Fasilitas
            //================================================================
            FasilitiesOffice(),
            // Container Deskripsi
            //================================================================
            DescriptionOffice(),
            // Button Book
            //================================================================
            BottomBook(),
          ],
        ),
      ),
    );
  }
}
