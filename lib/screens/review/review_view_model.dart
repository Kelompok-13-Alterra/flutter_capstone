// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, deprecated_member_use, avoid_web_libraries_in_flutter

import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter_capstone/services/review/review_service.dart';
import 'package:image_picker/image_picker.dart';

class ReviewViewModel extends ChangeNotifier {
  final int _transactionId = 0;
  int get transactionId => _transactionId;

  static int? _index;
  int get index => _index!;

  int _selectedFilterIndex = 0;
  int get selectedFilterIndex => _selectedFilterIndex;

  final List<String> _filters = [
    'Terdekat',
    'Rating Baik',
    'Termurah',
    'Fasilitas Lengkap'
  ];
  List<String> get filters => _filters;

  final List<Widget> _reviewList = [];
  List<Widget> get reviewList => _reviewList;

  final TextEditingController _reviewController = TextEditingController();
  TextEditingController get reviewController => _reviewController;

  double _rating = 0.0;
  double get rating => _rating;

  final _firstIndex = _index! * 2;
  get firstIndex => _firstIndex;

  final _secondIndex = _index! * 2 + 1;
  get secondIndex => _secondIndex;

  final ImagePicker _imgPicker = ImagePicker();
  ImagePicker get imgPicker => _imgPicker;

  final List<XFile> _imgFileList = [];
  List<XFile> get imgFileList => _imgFileList;

  _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.camera);
  }

  get pickImageFromCamera => _pickImageFromCamera();

  onRatingUpdate(rating) {
    _rating = rating;
    notifyListeners();
  }

  onSelected(bool selected) {
    _selectedFilterIndex = selected ? firstIndex : 0;
    notifyListeners();
  }

  onSelectedSecondIndex(bool selected) {
    _selectedFilterIndex = selected ? secondIndex : 0;
    notifyListeners();
  }

  selectImg() async {
    final List<XFile> selectImg = await imgPicker.pickMultiImage();
    if (selectImg.isNotEmpty) {
      imgFileList.addAll(selectImg);
    }
    notifyListeners();
  }

  deleteImage(data) {
    _imgFileList.remove(data);
    notifyListeners();
  }

  _submitReview(context) {
    if (_reviewController.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text("Please check what you input"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      return ReviewService().addPosted(
        context,
        transactionId: _transactionId,
        star: _rating,
        description: reviewController.text,
        tags: ['$_selectedFilterIndex'],
      );
    }
    _reviewController.clear();
    notifyListeners();
  }

  get submitReview => _submitReview(context);

  // submitReview(transactionId) async {
  //   _reviewController.clear();
  //   var review = await ReviewService().postReview(
  //     description: _reviewController.text,
  //     star: onRatingUpdate(rating),
  //   );
  //   if (_reviewController.text.isNotEmpty && onRatingUpdate(rating)) {
  //     var context;
  //     showModalBottomSheet(
  //         context: context,
  //         builder: (context) {
  //           return Column();
  //         });
  //   }
  //   notifyListeners();
  // }
}
