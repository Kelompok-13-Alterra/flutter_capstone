import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/home/model/home_model.dart';
import 'package:flutter_capstone/screens/home/services/home_services.dart';

class HomeViewModel with ChangeNotifier {
  List<Office> _listOffice = [];
  List<Office> get listOffice => _listOffice;
  HomeService homeService = HomeService();

  Future<void> getOffice() async {
    try {
      _listOffice = await homeService.fetchHomeData();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
