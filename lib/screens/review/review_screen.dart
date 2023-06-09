// ignore_for_file: library_private_types_in_public_api, unused_field, deprecated_member_use, avoid_unnecessary_containers, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/review/review_view_model.dart';
import 'package:flutter_capstone/services/review/review_service.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  var rating;

  // int _selectedFilterIndex = 0;
  // final List<String> _filters = [
  //   'Terdekat',
  //   'Rating Baik',
  //   'Termurah',
  //   'Fasilitas Lengkap'
  // ];
  // final List<Widget> _reviewList = [];

  // final TextEditingController _reviewController = TextEditingController();

  // double _rating = 0.0;

  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.camera);
  }

  Future<void> get pickImageFromCamera => _pickImageFromCamera();

  // void _submitReview() {
  //   _reviewController.clear();

  //   setState(() {});
  // }

  // final ImagePicker imgPicker = ImagePicker();
  // List<XFile> imgFileList = [];

  // void selectImg() async {
  //   final List<XFile> selectImg = await imgPicker.pickMultiImage();
  //   if (selectImg.isNotEmpty) {
  //     imgFileList.addAll(selectImg);
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    ReviewViewModel reviewProvider = Provider.of<ReviewViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: SourceColor().white,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: SourceColor().black,
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Review',
              style: TextStyle(fontSize: 16, fontWeight: regular),
            ),
            IconButton(
              icon: Icon(Icons.more_vert, color: SourceColor().black),
              onPressed: () {
                // Aksi ketika tombol tanda titik tiga ditekan
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: SourceColor().white,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                    ),
                    Text(
                      'Rate Your Experience',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: regular,
                        color: NeutralColor().neutral20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Are you satisfied with the service?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: regular,
                        color: NeutralColor().neutral60,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RatingBar.builder(
                      initialRating: reviewProvider.rating,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 50,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: SourceColor().yellow,
                      ),
                      onRatingUpdate: (rating) {
                        reviewProvider.onRatingUpdate(rating);
                        // setState(() {
                        //   _rating = rating;
                        // });
                      },
                    ),
                    const SizedBox(
                      height: 42,
                    ),
                    Text(
                      'Tell us what stood out',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: regular,
                        color: SourceColor().black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    spacing: 8.0,
                    children: List<Widget>.generate(
                        reviewProvider.filters.length ~/ 2, (int index) {
                      final firstIndex = index * 2;
                      final secondIndex = index * 2 + 1;
                      return Row(
                        children: [
                          ChoiceChip(
                            label: Text(
                              reviewProvider.filters[firstIndex],
                              style: TextStyle(
                                color: reviewProvider.selectedFilterIndex ==
                                        firstIndex
                                    ? NeutralColor().neutral100
                                    : NeutralColor().neutral60,
                              ),
                            ),
                            selected: reviewProvider.selectedFilterIndex ==
                                firstIndex,
                            selectedColor: SourceColor().seed,
                            onSelected: (bool selected) {
                              reviewProvider.onSelected(selected);
                              // setState(() {
                              //   _selectedFilterIndex =
                              //       selected ? firstIndex : 0;
                              // });
                            },
                          ),
                          const SizedBox(width: 8.0),
                          ChoiceChip(
                            label: Text(
                              reviewProvider.filters[secondIndex],
                              style: TextStyle(
                                color: reviewProvider.selectedFilterIndex ==
                                        secondIndex
                                    ? NeutralColor().neutral100
                                    : NeutralColor().neutral60,
                              ),
                            ),
                            selected: reviewProvider.selectedFilterIndex ==
                                secondIndex,
                            selectedColor: SourceColor().seed,
                            onSelected: (bool selected) {
                              reviewProvider.onSelectedSeconIndex(selected);
                              // setState(() {
                              //   _selectedFilterIndex =
                              //       selected ? secondIndex : 0;
                              // });
                            },
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),

              // Show Picked Image from Gallery
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 24, right: 16, left: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: reviewProvider.imgFileList.length,
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
                            File(reviewProvider.imgFileList[index].path),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 1,
                          child: GestureDetector(
                            onTap: () {
                              // deleteImage(
                              //   reviewProvider.imgFileList[index],
                              // );
                              reviewProvider.deleteImage(
                                  reviewProvider.imgFileList[index]);
                            },
                            child: Image.asset(
                              "assets/image/delete.png",
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
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: SourceColor().outline,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(4)),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: SizedBox(
                                width: double.infinity,
                                height: 98,
                                child: TextField(
                                  controller: reviewProvider.reviewController,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    hintText:
                                        'The Place is very cozy and also clean. So many kind of facilities here. Probably I`ll go back here someday.',
                                    hintStyle: const TextStyle(
                                      fontSize: 12,
                                    ),
                                    border: InputBorder.none,
                                    fillColor: SourceColor().white,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 1,
                              color: SourceColor().outline,
                            ),
                            Container(
                              padding: const EdgeInsets.all(0),
                              margin: const EdgeInsets.all(0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.photo_size_select_actual_outlined,
                                        color: PrimaryColor().primary,
                                      ),
                                      onPressed: () {
                                        reviewProvider.selectImg();
                                        // selectImg();
                                        // Navigator.pushNamed(
                                        //     context, '/image-picker');
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    color: SourceColor().outline,
                                    height: 48,
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                        color: PrimaryColor().primary,
                                      ),
                                      onPressed: _pickImageFromCamera,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () async {
                    reviewProvider.controllerReviewClear();
                    var review = await ReviewService().postReview(
                      description: reviewProvider.reviewController.text,
                      star: reviewProvider.onRatingUpdate(rating),
                    );
                    if (reviewProvider.reviewController.text.isNotEmpty &&
                        reviewProvider.onRatingUpdate(rating)) {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: SourceColor().white,
                        enableDrag: false,
                        isDismissible: false,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        )),
                        builder: (context) {
                          return FractionallySizedBox(
                            heightFactor: 309,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 55.71,
                                    bottom: 41.91,
                                  ),
                                  child: Image.asset(
                                    "assets/image/success_to_rate.png",
                                    width: 59.38,
                                    height: 59.38,
                                  ),
                                ),
                                Text(
                                  "Yey, kamu berhasil menilai office!",
                                  style: setTextStyle(NeutralColor().neutral17)
                                      .copyWith(
                                    fontSize: 16,
                                    fontWeight: medium,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Selamat! kamu berhasil menilai office! Silahkan lanjutkan submit!",
                                  style: setTextStyle(NeutralColor().neutral17)
                                      .copyWith(
                                    fontSize: 12,
                                    fontWeight: regular,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(365, 50),
                                    backgroundColor: PrimaryColor().primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                      ),
                                      child: Text("Okay!"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                  // reviewProvider.submitReview(reviewProvider.transactionId),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(365, 50),
                    backgroundColor: PrimaryColor().primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void deleteImage(data) {
  //   setState(() {
  //     imgFileList.remove(data);
  //   });
  // }
}
