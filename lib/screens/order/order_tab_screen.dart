//AUTHOR : ULFA LADAYYA
//KELAS C FLUTTER

// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerRatingScreen extends StatefulWidget {
  const ImagePickerRatingScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerRatingScreen> createState() =>
      _ImagePickerRatingScreenState();
}

class _ImagePickerRatingScreenState extends State<ImagePickerRatingScreen> {
  final ImagePicker imgPicker = ImagePicker();
  List<XFile>? imgFileList = [];

  void selectImg() async {
    final List<XFile>? selectImg = await imgPicker.pickMultiImage();
    if (selectImg != null && selectImg.isNotEmpty) {
      imgFileList!.addAll(selectImg);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: GridView.builder(
                itemCount: imgFileList!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Image.file(
                    File(imgFileList![index].path),
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: selectImg,
        child: const Icon(Icons.photo),
      ),
    );
  }
}
