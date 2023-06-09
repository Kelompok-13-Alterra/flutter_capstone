// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_capstone/services/review/review_service.dart';
import 'package:image_picker/image_picker.dart';

class ReviewViewModel extends ChangeNotifier {
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

  final double _rating = 0.0;
  double get rating => _rating;

  final int _transactionId = 0;
  int get transactionId => _transactionId;

  final ImagePicker _imgPicker = ImagePicker();
  ImagePicker get imgPicker => _imgPicker;

  final List<XFile> _imgFileList = [];
  List<XFile> get imgFileList => _imgFileList;

  onRatingUpdate(rating) {
    rating = _rating;
    notifyListeners();
  }

  onSelected(bool selected) {
    var firstIndex;
    _selectedFilterIndex = selected ? firstIndex : 0;
    notifyListeners();
  }

  onSelectedSeconIndex(bool selected) {
    var secondIndex;
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
    imgFileList.remove(data);
    notifyListeners();
  }

  controllerReviewClear() {
    _reviewController.clear();
    notifyListeners();
  }

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
