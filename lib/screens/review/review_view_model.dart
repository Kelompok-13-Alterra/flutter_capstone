// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, deprecated_member_use, avoid_web_libraries_in_flutter, await_only_futures, unnecessary_brace_in_string_interps, avoid_print

// import 'dart:js';
import 'package:flutter/material.dart';
// import 'package:flutter_capstone/model/midtrans/midtrans_model.dart';
// import 'package:flutter_capstone/screens/payment/detail_payment_screen.dart';
// import 'package:flutter_capstone/screens/payment/payment-view-model.dart';
import 'package:image_picker/image_picker.dart';

class ReviewViewModel extends ChangeNotifier {
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

  final ImagePicker _imgPicker = ImagePicker();
  ImagePicker get imgPicker => _imgPicker;

  final List<XFile> _imgFileList = [];
  List<XFile> get imgFileList => _imgFileList;

  onRatingUpdate(rating) {
    _rating = rating;
    print("halo ${_rating}");
    notifyListeners();
  }

  deleteImage(data) {
    _imgFileList.remove(data);
    notifyListeners();
  }

  int transactionID = 0;
  int get getTransactionID => transactionID;
  set setTransactionID(int val) {
    transactionID = val;
    notifyListeners();
  }
}
