// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/detail/detail/bottom-book.dart';
import 'package:flutter_capstone/screens/detail/detail/card-detail.dart';
import 'package:flutter_capstone/screens/detail/detail/deskripsi-ofiice.dart';
import 'package:flutter_capstone/screens/detail/detail/fasilities.dart';
import 'package:flutter_capstone/screens/detail/detail/image-detail.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          children: const [
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
