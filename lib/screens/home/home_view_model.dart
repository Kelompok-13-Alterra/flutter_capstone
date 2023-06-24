import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/home/home_model.dart';
import 'package:flutter_capstone/services/home/home_services.dart';

class HomeViewModel with ChangeNotifier {
  List<Office> _listOffice = [];
  List<Office> get listOffice => _listOffice;
  HomeService homeService = HomeService();
  int _selectedFilterIndex = 0;
  // double? rating;
  List<double> rating = [];

  final List<String> _filters = [
    'Semua',
    'Terdekat',
    'Rating Baik',
    'Termurah',
    // 'Fasilitas Lengkap'
  ];

  int get getSelectedFilterindex => _selectedFilterIndex;
  List<String> get getFilters => _filters;
  List<double> get getRating => rating;

  set setSelectedFilterIndex(int value) {
    _selectedFilterIndex = value;
    notifyListeners();
  }

  Future<List<Office>> getOffice() async {
    try {
      _listOffice = await homeService.fetchHomeData();
      notifyListeners();
      return _listOffice;
    } catch (e) {
      rethrow;
    }
  }

  set setRatingValue(double value) {
    rating.add(value);
    notifyListeners();
  }
}

//Maps

