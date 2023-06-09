import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/home/home_model.dart';
import 'package:flutter_capstone/model/order/booked_model.dart';
import 'package:flutter_capstone/services/home/home_services.dart';
import 'package:flutter_capstone/services/order/booked_service.dart';

class BookedViewModel with ChangeNotifier {
  List<Booked> _listBooked = [];
  List<Office> _listOffice = [];

  List<Booked> get listBooked => _listBooked;
  List<Office> get listOffice => _listOffice;
  BookedService bookedService = BookedService();
  HomeService homeService = HomeService();

  Future<void> getBooked() async {
    try {
      _listBooked = await bookedService.fetchBookedData();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getOffices() async {
    try {
      _listOffice = await homeService.fetchHomeData();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
