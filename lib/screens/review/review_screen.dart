// ignore_for_file: library_private_types_in_public_api, unused_field, deprecated_member_use, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = [
    'Terdekat',
    'Rating Baik',
    'Termurah',
    'Fasilitas Lengkap'
  ];
  final List<Widget> _reviewList = [];

  final TextEditingController _reviewController = TextEditingController();

  double _rating = 0.0;

  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.camera);

    if (pickedImage != null) {}
  }

  void _submitReview() {
    _reviewController.clear();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                        initialRating: _rating,
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
                          setState(() {
                            _rating = rating;
                          });
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
                      children: List<Widget>.generate(_filters.length ~/ 2,
                          (int index) {
                        final firstIndex = index * 2;
                        final secondIndex = index * 2 + 1;
                        return Row(
                          children: [
                            ChoiceChip(
                              label: Text(
                                _filters[firstIndex],
                                style: TextStyle(
                                  color: _selectedFilterIndex == firstIndex
                                      ? NeutralColor().neutral100
                                      : NeutralColor().neutral60,
                                ),
                              ),
                              selected: _selectedFilterIndex == firstIndex,
                              selectedColor: SourceColor().seed,
                              onSelected: (bool selected) {
                                setState(() {
                                  _selectedFilterIndex =
                                      selected ? firstIndex : 0;
                                });
                              },
                            ),
                            const SizedBox(width: 8.0),
                            ChoiceChip(
                              label: Text(
                                _filters[secondIndex],
                                style: TextStyle(
                                  color: _selectedFilterIndex == secondIndex
                                      ? NeutralColor().neutral100
                                      : NeutralColor().neutral60,
                                ),
                              ),
                              selected: _selectedFilterIndex == secondIndex,
                              selectedColor: SourceColor().seed,
                              onSelected: (bool selected) {
                                setState(() {
                                  _selectedFilterIndex =
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
                                    controller: _reviewController,
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
                                          Icons
                                              .photo_size_select_actual_outlined,
                                          color: PrimaryColor().primary,
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/image-picker');
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
                ElevatedButton(
                  onPressed: _submitReview,
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(328, 50),
                    backgroundColor: PrimaryColor().primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ));
  }
}
