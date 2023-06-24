import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/home/home_model.dart';
import 'package:flutter_capstone/model/search_office/search_model.dart';

class SearchOfficeViewModel with ChangeNotifier {
  final TextEditingController _searchBarController = TextEditingController();
  TextEditingController get searchBarController => _searchBarController;
  final String _searchName = "";
  String get searchName => _searchName;
  // Datum? model;
  Office? model;

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
}
