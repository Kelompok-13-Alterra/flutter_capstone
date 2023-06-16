//AUTHOR : ULFA LADAYYA
//KELAS C FLUTTER

// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerRatingScreen extends StatefulWidget {
  const ImagePickerRatingScreen({super.key});

  @override
  State<ImagePickerRatingScreen> createState() =>
      _ImagePickerRatingScreenState();
}

class _ImagePickerRatingScreenState extends State<ImagePickerRatingScreen> {
  final ImagePicker imgPicker = ImagePicker();
  List<XFile>? imgFileList = [];

  void selectImg() async {
    final List<XFile>? selectImg = await imgPicker.pickMultiImage();
    if (selectImg!.isNotEmpty) {
      imgFileList!.addAll(selectImg);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                ),
                child: IconButton(
                  color: const Color(0xFF005DB9),
                  onPressed: () {
                    selectImg();
                  },
                  icon: const Icon(Icons.image),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 24, right: 16, left: 16),
              child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: imgFileList!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(imgFileList![index].path),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 1,
                        child: GestureDetector(
                          onTap: () {
                            deleteImage(
                              imgFileList![index],
                            );
                          },
                          child: Image.asset(
                            "assets/icons/rating/delete.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(9),
            //   child: GridView.builder(
            //       itemCount: imgFileList!.length,
            //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 4),
            //       itemBuilder: (BuildContext context, int index) {
            //         return Image.file(
            //           File(imgFileList![index].path),
            //           fit: BoxFit.cover,
            //         );
            //       }),
            // ),
          ),
        ],
      ),
    );
  }

  void deleteImage(data) {
    setState(() {
      imgFileList!.remove(data);
    });
  }
}
