import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/order/history_model.dart';
import 'package:flutter_capstone/services/order/history_service.dart';

class HistoryViewModel with ChangeNotifier {
  List<History> _listHistory = [];
  List<Office> _listOffice = [];

  List<History> get listHistory => _listHistory;
  List<Office> get listOffice => _listOffice;

  HistoryService historyService = HistoryService();

  Future<void> getBooked(BuildContext context) async { 
    try {
      _listHistory = await historyService.fetchHistoryData();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
