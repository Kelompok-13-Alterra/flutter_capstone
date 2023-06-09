import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/home/home_model.dart';
import 'package:flutter_capstone/model/order/history_model.dart';
import 'package:flutter_capstone/services/home/home_services.dart';
import 'package:flutter_capstone/services/order/history_service.dart';

class HistoryViewModel with ChangeNotifier {
  List<History> _listHistory = [];
  List<Office> _listOffice = []; // Tambahkan field untuk menyimpan data office

  List<History> get listHistory => _listHistory;
  List<Office> get listOffice =>
      _listOffice; // Tambahkan getter untuk data office

  HistoryService historyService = HistoryService();
  HomeService homeService =
      HomeService(); // Tambahkan instance dari HomeService

  Future<void> getBooked() async {
    try {
      _listHistory = await historyService.fetchHistoryData();
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
