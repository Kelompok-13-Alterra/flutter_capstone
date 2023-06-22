// ignore_for_file: library_private_types_in_public_api, unused_field, deprecated_member_use, avoid_unnecessary_containers, unused_local_variable, use_build_context_synchronously, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/review/review_view_model.dart';
import 'package:flutter_capstone/services/review/review_service.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class ReviewArguments {
  final int transactionId;

  ReviewArguments({required this.transactionId});
}

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.camera);
  }

  final ImagePicker _imgPicker = ImagePicker();
  final List<XFile> _imgFileList = [];

  void selectImg() async {
    final List<XFile> selectImg = await _imgPicker.pickMultiImage();
    if (selectImg.isNotEmpty) {
      _imgFileList.addAll(selectImg);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as ReviewArguments?;

    //Provider
    ReviewViewModel reviewProvider = Provider.of<ReviewViewModel>(context);
    print("tes : ${args?.transactionId}");

    //Submit review
    _submitReview() async {
      if (reviewProvider.reviewController.text.isEmpty
          // && imgFileList.isNotEmpty
          ) {
        const snackBar = SnackBar(
          content: Text("Please check what you input !"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        return ReviewService().addPosted(
          context,
          transactionId: args!.transactionId,
          star: reviewProvider.rating,
          description: reviewProvider.reviewController.text,
          tags: reviewProvider.reviewList,
        );
      }
      print("args : ${args?.transactionId}");
      reviewProvider.clearField;
      // setState(() {
      //   reviewProvider.reviewController.clear();
      // });
    }

    print('Id Traksaksi : ${args?.transactionId}');
    print("desc : ${reviewProvider.reviewController.text}}");
    print("star : ${reviewProvider.rating}");
    print("tags : ${reviewProvider.reviewList}");

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: SourceColor().white,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: SourceColor().black,
            onPressed: () {
              reviewProvider.reviewList.clear();
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
                        //    rating = rating ;
                        //   // rate = rating;
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
                    runSpacing: 8.0,
                    spacing: 8.0,
                    children: reviewProvider.filters.map((e) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          selectedColor: SourceColor().seed,
                          label: Text(e),
                          selected: reviewProvider.reviewList.contains(e),
                          onSelected: (bool value) {
                            // reviewProvider.onSelected(value);
                            if (reviewProvider.reviewList.contains(e)) {
                              reviewProvider.reviewList.remove(e.toString());
                            } else {
                              reviewProvider.reviewList.add(e.toString());
                            }
                            // if (args!.transactionId != args.transactionId) {
                            setState(() {});
                            // }
                          },
                        ),
                      );
                    }).toList(),
                    // List<Widget>.generate(
                    //   reviewProvider.filters.length ~/ 2, (int index) {
                    // final firstIndex = index * 2;
                    // final secondIndex = index * 2 + 1;
                    // // final firstIndex = reviewProvider.firstIndex;
                    // // final secondIndex = reviewProvider.secondIndex;
                    // return Row(
                    // children: [
                    //       FilterChip(
                    //         label: Text(
                    //           reviewProvider.filters[firstIndex],
                    //           style: TextStyle(
                    //             color: selectedFilterIndex == firstIndex
                    //                 ? NeutralColor().neutral100
                    //                 : NeutralColor().neutral60,
                    //           ),
                    //         ),
                    //         selected:
                    //             // reviewProvider.filters[firstIndex],
                    //             selectedFilterIndex == firstIndex,
                    //         selectedColor: SourceColor().seed,
                    //         onSelected: (bool selected) {
                    //           //reviewProvider.onSelected(selected);
                    //           setState(() {
                    //             selectedFilterIndex = selected ? firstIndex : 0;
                    //           });
                    //         },
                    //       ),
                    //       const SizedBox(width: 8.0),
                    //       ChoiceChip(
                    //         label: Text(
                    //           reviewProvider.filters[secondIndex],
                    //           style: TextStyle(
                    //             color: selectedFilterIndex == secondIndex
                    //                 ? NeutralColor().neutral100
                    //                 : NeutralColor().neutral60,
                    //           ),
                    //         ),
                    //         selected: selectedFilterIndex == secondIndex,
                    //         selectedColor: SourceColor().seed,
                    //         onSelected: (bool selected) {
                    //           //reviewProvider.onSelectedSecondIndex(selected);
                    //           setState(() {
                    // selectedFilterIndex =
                    //                 selected ? secondIndex : 0;
                    //           });
                    //         },
                    //       ),
                    //     ],
                    //   );
                    // }),
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
                  itemCount: _imgFileList.length,
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
                            File(_imgFileList[index].path),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 1,
                          child: GestureDetector(
                            onTap: () {
                              // var data;
                              // reviewProvider.deleteImage();
                              // deleteImage();
                              deleteImage(
                                _imgFileList[index],
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
                                        selectImg();
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
                  onPressed: _submitReview,
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

  void deleteImage(data) {
    setState(() {
      _imgFileList.remove(data);
    });
  }
}
