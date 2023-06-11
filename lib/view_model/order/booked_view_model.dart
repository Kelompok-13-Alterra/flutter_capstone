import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/order/booked_model.dart';
import 'package:flutter_capstone/services/order/booked_service.dart';

class BookedViewModel with ChangeNotifier {
  List<Booked> _listBooked = [];
  List<Office> _listOffice = [];

  List<Booked> get listBooked => _listBooked;
  List<Office> get listOffice => _listOffice;
  BookedService bookedService = BookedService();

  Future<void> getBooked(BuildContext context) async {
    try {
      _listBooked = await bookedService.fetchBookedData();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
