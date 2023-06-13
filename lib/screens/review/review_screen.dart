// // ignore_for_file: library_private_types_in_public_api, unused_field, deprecated_member_use, avoid_unnecessary_containers, unused_local_variable, use_build_context_synchronously, prefer_typing_uninitialized_variables

// ignore_for_file: library_private_types_in_public_api, unused_field, deprecated_member_use, avoid_unnecessary_containers, unused_local_variable, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/payment/payment-view-model.dart';
import 'package:flutter_capstone/screens/review/review_view_model.dart';
import 'package:flutter_capstone/services/review/review_service.dart';
//import 'package:flutter_capstone/services/review/review_service.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  int selectedFilterIndex = 0;
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

  // ReviewService().addPost(
  //   // _rating,
  //   // _reviewController.text,
  //   // _filters,
  //   4.5,
  //   "The place is very cozy and the facilities are complete.",
  //   ["Terdekat"],
  // );
  final ImagePicker _imgPicker = ImagePicker();
  final List<XFile> _imgFileList = [];

  void selectImg() async {
    final List<XFile> selectImg = await _imgPicker.pickMultiImage();
    if (selectImg.isNotEmpty) {
      _imgFileList.addAll(selectImg);
    }
    setState(() {});
  }

  late PaymentViewModel paymentViewModel;
  @override
  void initState() {
    paymentViewModel = Provider.of<PaymentViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ReviewViewModel reviewProvider = Provider.of<ReviewViewModel>(context);
    _submitReview() async {
      if (reviewProvider.reviewController.text.isEmpty
          // && imgFileList.isNotEmpty
          ) {
        // print("tes : ${reviewProvider.reviewController.text.isEmpty}");
        const snackBar = SnackBar(
          content: Text("Please check what you input"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        // print("tes 1 : ${paymentViewModel.getTransactionID}");
        // print("ini : ${paymentViewModel.getTransactionID}");
        return ReviewService().addPosted(
          context,
          transactionId: paymentViewModel.getTransactionID,
          star: reviewProvider.rating,
          description: reviewProvider.reviewController.text,
          tags: ['$selectedFilterIndex'],
        );
      }
    
      setState(() {
        reviewProvider.reviewController.clear();
      });
    }
    //Provider

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
                    spacing: 8.0,
                    children: List<Widget>.generate(
                        reviewProvider.filters.length ~/ 2, (int index) {
                      final firstIndex = index * 2;
                      final secondIndex = index * 2 + 1;
                      // final firstIndex = reviewProvider.firstIndex;
                      // final secondIndex = reviewProvider.secondIndex;
                      return Row(
                        children: [
                          ChoiceChip(
                            label: Text(
                              reviewProvider.filters[firstIndex],
                              style: TextStyle(
                                color: selectedFilterIndex == firstIndex
                                    ? NeutralColor().neutral100
                                    : NeutralColor().neutral60,
                              ),
                            ),
                            selected: selectedFilterIndex == firstIndex,
                            selectedColor: SourceColor().seed,
                            onSelected: (bool selected) {
                              //reviewProvider.onSelected(selected);
                              setState(() {
                                selectedFilterIndex = selected ? firstIndex : 0;
                              });
                            },
                          ),
                          const SizedBox(width: 8.0),
                          ChoiceChip(
                            label: Text(
                              reviewProvider.filters[secondIndex],
                              style: TextStyle(
                                color: selectedFilterIndex == secondIndex
                                    ? NeutralColor().neutral100
                                    : NeutralColor().neutral60,
                              ),
                            ),
                            selected: selectedFilterIndex == secondIndex,
                            selectedColor: SourceColor().seed,
                            onSelected: (bool selected) {
                              //reviewProvider.onSelectedSecondIndex(selected);
                              setState(() {
                                selectedFilterIndex =
                                    selected ? secondIndex : 0;
                              });
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
                              // deleteImage();
                              deleteImage(
                                _imgFileList[index],
                              );
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



// import 'package:flutter/material.dart';
// import 'package:flutter_capstone/model/review/review_model.dart';
// import 'package:flutter_capstone/screens/review/review_view_model.dart';
// import 'package:flutter_capstone/services/review/review_service.dart';
// import 'package:flutter_capstone/style/text_style.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// import 'package:provider/provider.dart';

// class ReviewScreen extends StatefulWidget {
//   const ReviewScreen({Key? key}) : super(key: key);

//   @override
//   _ReviewScreenState createState() => _ReviewScreenState();
// }

// class _ReviewScreenState extends State<ReviewScreen> {
//   late double _rating = 0.0;
//   // ReviewModel? review;
//   Data? review;
//   // ReviewModel? data;
//   // int _selectedFilterIndex = 0;
//   // final List<String> _filters = [
//   //   'Terdekat',
//   //   'Rating Baik',
//   //   'Termurah',
//   //   'Fasilitas Lengkap'
//   // ];
//   // final List<Widget> _reviewList = [];

//   // final TextEditingController _reviewController = TextEditingController();
//   final TextEditingController _tagController = TextEditingController();

//   Future<void> _pickImageFromCamera() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.getImage(source: ImageSource.camera);
//   }

//   Future<void> get pickImageFromCamera => _pickImageFromCamera();

//   // void _submitReview() {
//   //   _reviewController.clear();

//   //   setState(() {});
//   // }

//   // final ImagePicker imgPicker = ImagePicker();
//   // List<XFile> imgFileList = [];

//   // void selectImg() async {
//   //   final List<XFile> selectImg = await imgPicker.pickMultiImage();
//   //   if (selectImg.isNotEmpty) {
//   //     imgFileList.addAll(selectImg);
//   //   }
//   //   setState(() {});
//   // }

//   @override
//   Widget build(BuildContext context) {
//     ReviewViewModel reviewProvider = Provider.of<ReviewViewModel>(context);
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: SourceColor().white,
//         leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             color: SourceColor().black,
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Review',
//               style: TextStyle(fontSize: 16, fontWeight: regular),
//             ),
//             IconButton(
//               icon: Icon(Icons.more_vert, color: SourceColor().black),
//               onPressed: () {
//                 // Aksi ketika tombol tanda titik tiga ditekan
//               },
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           color: SourceColor().white,
//           child: Column(
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Align(
//                       alignment: Alignment.topLeft,
//                     ),
//                     Text(
//                       'Rate Your Experience',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: regular,
//                         color: NeutralColor().neutral20,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       'Are you satisfied with the service?',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: regular,
//                         color: NeutralColor().neutral60,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     RatingBar.builder(
//                       // initialRating: reviewProvider.rating.toInt() as double,
//                       initialRating: _rating,
//                       minRating: 0,
//                       direction: Axis.horizontal,
//                       allowHalfRating: true,
//                       itemCount: 5,
//                       itemSize: 50,
//                       itemBuilder: (context, _) => Icon(
//                         Icons.star,
//                         color: SourceColor().yellow,
//                       ),
//                       onRatingUpdate: (rating) {
//                         setState(() {
//                           _rating = rating;
//                         });
//                         // reviewProvider.onRatingUpdate(rating);
//                         // setState(() {
//                         //   _rating = rating;
//                         // });
//                       },
//                     ),
//                     Text("Rating : $_rating"),
//                     const SizedBox(
//                       height: 42,
//                     ),
//                     Text(
//                       'Tell us what stood out',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: regular,
//                         color: SourceColor().black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Align(
//                   alignment: Alignment.topLeft,
//                   child: Wrap(
//                     spacing: 8.0,
//                     children: List<Widget>.generate(
//                         reviewProvider.filters.length ~/ 2, (int index) {
//                       // reviewProvider.firstIndex;
//                       // reviewProvider.secondIndex;
//                       final firstIndex = index * 2;
//                       final secondIndex = index * 2 + 1;
//                       return Row(
//                         children: [
//                           ChoiceChip(
//                             label: Text(
//                               reviewProvider.filters[firstIndex],
//                               style: TextStyle(
//                                 color: reviewProvider.selectedFilterIndex ==
//                                         firstIndex
//                                     ? NeutralColor().neutral100
//                                     : NeutralColor().neutral60,
//                               ),
//                             ),
//                             selected: reviewProvider.selectedFilterIndex ==
//                                 firstIndex,
//                             selectedColor: SourceColor().seed,
//                             onSelected: (bool selected) {
//                               reviewProvider.onSelected(selected);
//                               // setState(() {
//                               //   _selectedFilterIndex =
//                               //       selected ? firstIndex : 0;
//                               // });
//                             },
//                           ),
//                           const SizedBox(width: 8.0),
//                           ChoiceChip(
//                             label: Text(
//                               reviewProvider.filters[secondIndex],
//                               style: TextStyle(
//                                 color: reviewProvider.selectedFilterIndex ==
//                                         secondIndex
//                                     ? NeutralColor().neutral100
//                                     : NeutralColor().neutral60,
//                               ),
//                             ),
//                             selected: reviewProvider.selectedFilterIndex ==
//                                 secondIndex,
//                             selectedColor: SourceColor().seed,
//                             onSelected: (bool selected) {
//                               reviewProvider.onSelectedSeconIndex(selected);
//                               // setState(() {
//                               //   _selectedFilterIndex =
//                               //       selected ? secondIndex : 0;
//                               // });
//                             },
//                           ),
//                         ],
//                       );
//                     }),
//                   ),
//                 ),
//               ),

//               // Show Picked Image from Gallery
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 20, bottom: 24, right: 16, left: 16),
//                 child: GridView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.vertical,
//                   itemCount: reviewProvider.imgFileList.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 4,
//                     mainAxisSpacing: 4,
//                     crossAxisSpacing: 4,
//                   ),
//                   itemBuilder: (BuildContext context, int index) {
//                     return Stack(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.file(
//                             File(reviewProvider.imgFileList[index].path),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         Positioned(
//                           right: 1,
//                           child: GestureDetector(
//                             onTap: () {
//                               // deleteImage(
//                               //   reviewProvider.imgFileList[index],
//                               // );
//                               reviewProvider.deleteImage(
//                                   reviewProvider.imgFileList[index]);
//                             },
//                             child: Image.asset(
//                               "assets/image/delete.png",
//                               width: 20,
//                               height: 20,
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                               color: SourceColor().outline,
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(4)),
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: SizedBox(
//                                 width: double.infinity,
//                                 height: 98,
//                                 child: TextField(
//                                   controller: reviewProvider.reviewController,
//                                   maxLines: 4,
//                                   decoration: InputDecoration(
//                                     hintText:
//                                         'The Place is very cozy and also clean. So many kind of facilities here. Probably I`ll go back here someday.',
//                                     hintStyle: const TextStyle(
//                                       fontSize: 12,
//                                     ),
//                                     border: InputBorder.none,
//                                     fillColor: SourceColor().white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               height: 1,
//                               color: SourceColor().outline,
//                             ),
//                             Container(
//                               padding: const EdgeInsets.all(0),
//                               margin: const EdgeInsets.all(0),
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     child: IconButton(
//                                       icon: Icon(
//                                         Icons.photo_size_select_actual_outlined,
//                                         color: PrimaryColor().primary,
//                                       ),
//                                       onPressed: () {
//                                         reviewProvider.selectImg();
//                                         // selectImg();
//                                         // Navigator.pushNamed(
//                                         //     context, '/image-picker');
//                                       },
//                                     ),
//                                   ),
//                                   Container(
//                                     width: 1,
//                                     color: SourceColor().outline,
//                                     height: 48,
//                                   ),
//                                   Expanded(
//                                     child: IconButton(
//                                       icon: Icon(
//                                         Icons.camera_alt_outlined,
//                                         color: PrimaryColor().primary,
//                                       ),
//                                       onPressed: _pickImageFromCamera,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               TextField(
//                 controller: _tagController,
//                 maxLines: 4,
//                 decoration: InputDecoration(
//                   hintText: 'Input tags. Ex : #TechnoOffice',
//                   hintStyle: const TextStyle(
//                     fontSize: 12,
//                   ),
//                   border: InputBorder.none,
//                   fillColor: SourceColor().white,
//                 ),
//               ),
//               SizedBox(
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     if (reviewProvider.reviewController.text.isEmpty) {
//                       const snackBar = SnackBar(
//                         content: Text("Please check what you input"),
//                       );
//                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                     } else {
//                       ReviewService().addPost(
//                         4.5,
//                         "The place is very cozy and the facilities are complete.",
//                         "Terdekat",
//                       );
//                     }
//                     reviewProvider.controllerReviewClear();
//                     //the place is very cozy and the facilities are complete
//                     // ReviewService().postReview();
//                     // Data? result = await ReviewService().postReview(
//                     //     5, "Office nya bagus dan fasilitasnya juga lengkap.");
//                     // if (result != null) {
//                     //   setState(() {
//                     //     review = result;
//                     //   });
//                     //   showModalBottomSheet(
//                     //     context: context,
//                     //     isScrollControlled: true,
//                     //     backgroundColor: SourceColor().white,
//                     //     enableDrag: false,
//                     //     isDismissible: false,
//                     //     shape: const RoundedRectangleBorder(
//                     //         borderRadius: BorderRadius.vertical(
//                     //       top: Radius.circular(10),
//                     //     )),
//                     //     builder: (context) {
//                     //       return FractionallySizedBox(
//                     //         heightFactor: 309,
//                     //         child: Column(
//                     //           mainAxisAlignment: MainAxisAlignment.center,
//                     //           crossAxisAlignment: CrossAxisAlignment.center,
//                     //           children: [
//                     //             Padding(
//                     //               padding: const EdgeInsets.only(
//                     //                 top: 55.71,
//                     //                 bottom: 41.91,
//                     //               ),
//                     //               child: Image.asset(
//                     //                 "assets/image/success_to_rate.png",
//                     //                 width: 59.38,
//                     //                 height: 59.38,
//                     //               ),
//                     //             ),
//                     //             Text(
//                     //               "Yey, kamu berhasil menilai office!",
//                     //               style: setTextStyle(NeutralColor().neutral17)
//                     //                   .copyWith(
//                     //                 fontSize: 16,
//                     //                 fontWeight: medium,
//                     //               ),
//                     //             ),
//                     //             const SizedBox(
//                     //               height: 4,
//                     //             ),
//                     //             Text(
//                     //               "Selamat! kamu berhasil menilai office! Silahkan lanjutkan submit!",
//                     //               style: setTextStyle(NeutralColor().neutral17)
//                     //                   .copyWith(
//                     //                 fontSize: 12,
//                     //                 fontWeight: regular,
//                     //               ),
//                     //             ),
//                     //             const SizedBox(
//                     //               height: 16,
//                     //             ),
//                     //             ElevatedButton(
//                     //               onPressed: () {},
//                     //               style: ElevatedButton.styleFrom(
//                     //                 fixedSize: const Size(365, 50),
//                     //                 backgroundColor: PrimaryColor().primary,
//                     //                 shape: RoundedRectangleBorder(
//                     //                   borderRadius: BorderRadius.circular(100),
//                     //                 ),
//                     //               ),
//                     //               child: const Center(
//                     //                 child: Padding(
//                     //                   padding: EdgeInsets.only(
//                     //                     top: 15,
//                     //                     bottom: 15,
//                     //                   ),
//                     //                   child: Text("Okay!"),
//                     //                 ),
//                     //               ),
//                     //             ),
//                     //           ],
//                     //         ),
//                     //       );
//                     //     },
//                     //   );
//                     // }

//                     // ReviewService().postReview(reviewProvider.rating.toInt(),
//                     //     reviewProvider.reviewController.text);
//                     // if (result != null) {
//                     //   data = result;
//                     // }
//                     // var review = await ReviewService().postReview(
//                     // description: reviewProvider.reviewController.text,
//                     // star: reviewProvider.onRatingUpdate(rating),
//                     // star: reviewProvider.rating.toInt(),
//                     // );
//                     // if (reviewProvider.reviewController.text.isNotEmpty &&
//                     //     reviewProvider.onRatingUpdate(rating)) {
//                     //   showModalBottomSheet(
//                     //     context: context,
//                     //     isScrollControlled: true,
//                     //     backgroundColor: SourceColor().white,
//                     //     enableDrag: false,
//                     //     isDismissible: false,
//                     //     shape: const RoundedRectangleBorder(
//                     //         borderRadius: BorderRadius.vertical(
//                     //       top: Radius.circular(10),
//                     //     )),
//                     //     builder: (context) {
//                     //       return FractionallySizedBox(
//                     //         heightFactor: 309,
//                     //         child: Column(
//                     //           mainAxisAlignment: MainAxisAlignment.center,
//                     //           crossAxisAlignment: CrossAxisAlignment.center,
//                     //           children: [
//                     //             Padding(
//                     //               padding: const EdgeInsets.only(
//                     //                 top: 55.71,
//                     //                 bottom: 41.91,
//                     //               ),
//                     //               child: Image.asset(
//                     //                 "assets/image/success_to_rate.png",
//                     //                 width: 59.38,
//                     //                 height: 59.38,
//                     //               ),
//                     //             ),
//                     //             Text(
//                     //               "Yey, kamu berhasil menilai office!",
//                     //               style: setTextStyle(NeutralColor().neutral17)
//                     //                   .copyWith(
//                     //                 fontSize: 16,
//                     //                 fontWeight: medium,
//                     //               ),
//                     //             ),
//                     //             const SizedBox(
//                     //               height: 4,
//                     //             ),
//                     //             Text(
//                     //               "Selamat! kamu berhasil menilai office! Silahkan lanjutkan submit!",
//                     //               style: setTextStyle(NeutralColor().neutral17)
//                     //                   .copyWith(
//                     //                 fontSize: 12,
//                     //                 fontWeight: regular,
//                     //               ),
//                     //             ),
//                     //             const SizedBox(
//                     //               height: 16,
//                     //             ),
//                     //             ElevatedButton(
//                     //               onPressed: () {},
//                     //               style: ElevatedButton.styleFrom(
//                     //                 fixedSize: const Size(365, 50),
//                     //                 backgroundColor: PrimaryColor().primary,
//                     //                 shape: RoundedRectangleBorder(
//                     //                   borderRadius: BorderRadius.circular(100),
//                     //                 ),
//                     //               ),
//                     //               child: const Center(
//                     //                 child: Padding(
//                     //                   padding: EdgeInsets.only(
//                     //                     top: 15,
//                     //                     bottom: 15,
//                     //                   ),
//                     //                   child: Text("Okay!"),
//                     //                 ),
//                     //               ),
//                     //             ),
//                     //           ],
//                     //         ),
//                     //       );
//                     //     },
//                     //   );
//                     // }
//                   },
//                   // reviewProvider.submitReview(reviewProvider.transactionId),
//                   style: ElevatedButton.styleFrom(
//                     fixedSize: const Size(365, 50),
//                     backgroundColor: PrimaryColor().primary,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(100),
//                     ),
//                   ),
//                   child: const Text('Submit'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // void deleteImage(data) {
//   //   setState(() {
//   //     imgFileList.remove(data);
//   //   });
//   // }
// }


// import 'package:flutter/material.dart';
// import 'package:flutter_capstone/style/text_style.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class ReviewScreen extends StatefulWidget {
//   const ReviewScreen({Key? key}) : super(key: key);

//   @override
//   _ReviewScreenState createState() => _ReviewScreenState();
// }

// class _ReviewScreenState extends State<ReviewScreen> {
//   int _selectedFilterIndex = 0;
//   final List<String> _filters = [
//     'Terdekat',
//     'Rating Baik',
//     'Termurah',
//     'Fasilitas Lengkap'
//   ];
//   final List<Widget> _reviewList = [];

//   final TextEditingController _reviewController = TextEditingController();

//   double _rating = 0.0;

//   Future<void> _pickImageFromCamera() async {
//     // final picker = ImagePicker();
//     // final pickedImage = await picker.getImage(source: ImageSource.camera);
//   }

//   void _submitReview() {
//     _reviewController.clear();

//     setState(() {});
//   }

//   final ImagePicker imgPicker = ImagePicker();
//   List<XFile> imgFileList = [];

//   void selectImg() async {
//     final List<XFile> selectImg = await imgPicker.pickMultiImage();
//     if (selectImg.isNotEmpty) {
//       imgFileList.addAll(selectImg);
//     }
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: SourceColor().white,
//         leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             color: SourceColor().black,
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Review',
//               style: TextStyle(fontSize: 16, fontWeight: regular),
//             ),
//             IconButton(
//               icon: Icon(Icons.more_vert, color: SourceColor().black),
//               onPressed: () {
//                 // Aksi ketika tombol tanda titik tiga ditekan
//               },
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           color: SourceColor().white,
//           child: Column(
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Align(
//                       alignment: Alignment.topLeft,
//                     ),
//                     Text(
//                       'Rate Your Experience',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: regular,
//                         color: NeutralColor().neutral20,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       'Are you satisfied with the service?',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: regular,
//                         color: NeutralColor().neutral60,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     RatingBar.builder(
//                       initialRating: _rating,
//                       minRating: 0,
//                       direction: Axis.horizontal,
//                       allowHalfRating: true,
//                       itemCount: 5,
//                       itemSize: 50,
//                       itemBuilder: (context, _) => Icon(
//                         Icons.star,
//                         color: SourceColor().yellow,
//                       ),
//                       onRatingUpdate: (rating) {
//                         setState(() {
//                           _rating = rating;
//                         });
//                       },
//                     ),
//                     const SizedBox(
//                       height: 42,
//                     ),
//                     Text(
//                       'Tell us what stood out',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: regular,
//                         color: SourceColor().black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Align(
//                   alignment: Alignment.topLeft,
//                   child: Wrap(
//                     spacing: 8.0,
//                     children: List<Widget>.generate(_filters.length ~/ 2,
//                         (int index) {
//                       final firstIndex = index * 2;
//                       final secondIndex = index * 2 + 1;
//                       return Row(
//                         children: [
//                           ChoiceChip(
//                             label: Text(
//                               _filters[firstIndex],
//                               style: TextStyle(
//                                 color: _selectedFilterIndex == firstIndex
//                                     ? NeutralColor().neutral100
//                                     : NeutralColor().neutral60,
//                               ),
//                             ),
//                             selected: _selectedFilterIndex == firstIndex,
//                             selectedColor: SourceColor().seed,
//                             onSelected: (bool selected) {
//                               setState(() {
//                                 _selectedFilterIndex =
//                                     selected ? firstIndex : 0;
//                               });
//                             },
//                           ),
//                           const SizedBox(width: 8.0),
//                           ChoiceChip(
//                             label: Text(
//                               _filters[secondIndex],
//                               style: TextStyle(
//                                 color: _selectedFilterIndex == secondIndex
//                                     ? NeutralColor().neutral100
//                                     : NeutralColor().neutral60,
//                               ),
//                             ),
//                             selected: _selectedFilterIndex == secondIndex,
//                             selectedColor: SourceColor().seed,
//                             onSelected: (bool selected) {
//                               setState(() {
//                                 _selectedFilterIndex =
//                                     selected ? secondIndex : 0;
//                               });
//                             },
//                           ),
//                         ],
//                       );
//                     }),
//                   ),
//                 ),
//               ),

//               // Show Picked Image from Gallery
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 20, bottom: 24, right: 16, left: 16),
//                 child: GridView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.vertical,
//                   itemCount: imgFileList.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 4,
//                     mainAxisSpacing: 4,
//                     crossAxisSpacing: 4,
//                   ),
//                   itemBuilder: (BuildContext context, int index) {
//                     return Stack(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.file(
//                             File(imgFileList[index].path),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         Positioned(
//                           right: 1,
//                           child: GestureDetector(
//                             onTap: () {
//                               deleteImage(
//                                 imgFileList[index],
//                               );
//                             },
//                             child: Image.asset(
//                               "assets/image/delete.png",
//                               width: 20,
//                               height: 20,
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                               color: SourceColor().outline,
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(4)),
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: SizedBox(
//                                 width: double.infinity,
//                                 height: 98,
//                                 child: TextField(
//                                   controller: _reviewController,
//                                   maxLines: 4,
//                                   decoration: InputDecoration(
//                                     hintText:
//                                         'The Place is very cozy and also clean. So many kind of facilities here. Probably I`ll go back here someday.',
//                                     hintStyle: const TextStyle(
//                                       fontSize: 12,
//                                     ),
//                                     border: InputBorder.none,
//                                     fillColor: SourceColor().white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               height: 1,
//                               color: SourceColor().outline,
//                             ),
//                             Container(
//                               padding: const EdgeInsets.all(0),
//                               margin: const EdgeInsets.all(0),
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     child: IconButton(
//                                       icon: Icon(
//                                         Icons.photo_size_select_actual_outlined,
//                                         color: PrimaryColor().primary,
//                                       ),
//                                       onPressed: () {
//                                         selectImg();
//                                         // Navigator.pushNamed(
//                                         //     context, '/image-picker');
//                                       },
//                                     ),
//                                   ),
//                                   Container(
//                                     width: 1,
//                                     color: SourceColor().outline,
//                                     height: 48,
//                                   ),
//                                   Expanded(
//                                     child: IconButton(
//                                       icon: Icon(
//                                         Icons.camera_alt_outlined,
//                                         color: PrimaryColor().primary,
//                                       ),
//                                       onPressed: _pickImageFromCamera,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 child: ElevatedButton(
//                   onPressed: _submitReview,
//                   style: ElevatedButton.styleFrom(
//                     fixedSize: const Size(365, 50),
//                     backgroundColor: PrimaryColor().primary,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(100),
//                     ),
//                   ),
//                   child: const Text('Submit'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void deleteImage(data) {
//     setState(() {
//       imgFileList.remove(data);
//     });
//   }
// }
