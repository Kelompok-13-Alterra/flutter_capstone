import 'package:flutter/material.dart';
import 'package:flutter_capstone/errors/location_not_found.dart';
import 'package:flutter_capstone/model/search_office/search_model.dart';

class SearchOfficeViewModel with ChangeNotifier {
  final TextEditingController _searchBarController = TextEditingController();
  TextEditingController get searchBarController => _searchBarController;
  String _searchName = "";
  String get searchName => _searchName;
  Datum? model;

  onChange(String value) {
    if (value.length >= 3) {
      _searchName = value;
      notifyListeners();
    }
    //else if (value != model?.location) {
    //   const LocationNotFoundScreen();
    //   notifyListeners();
    // }
  }
}
