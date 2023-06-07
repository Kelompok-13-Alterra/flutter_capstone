import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/search_office/search_model.dart';

class SearchOfficeViewModel with ChangeNotifier {
  final TextEditingController _searchBarController = TextEditingController();
  TextEditingController get searchBarController => _searchBarController;
  final String _searchName = "";
  String get searchName => _searchName;
  Datum? model;

  bool _isSearch = false;
  bool get isSearch => _isSearch;

  String _searchQuery = "";
  String get searchQuery => _searchQuery;

  onChange(String value) {
    // _searchQuery = value;
    if (value.length >= 3) {
      _searchQuery = value;
      _isSearch = true;
    }
    notifyListeners();
  }

  // onChange(String value) {
  //   if (_searchQuery == "" && searchQuery.length <= 3 && isSearch == false) {
  //     _isSearch = true;
  //     _searchQuery = value;
  //     notifyListeners();
  //   }
  // }
// _searchQuery == "" && searchQuery.length <= 3
  // onChange(String value) {
  //   if (value.length >= 3) {
  //     _searchName = value;
  //     notifyListeners();
  //   }
  //   //else if (value != model?.location) {
  //   //   const LocationNotFoundScreen();
  //   //   notifyListeners();
  //   // }
  // }
}
