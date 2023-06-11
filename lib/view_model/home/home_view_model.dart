import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/home/home_model.dart';
import 'package:flutter_capstone/services/home/home_services.dart';
import 'package:provider/provider.dart';

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
