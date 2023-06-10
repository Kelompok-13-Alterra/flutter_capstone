import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/detail/detail_model.dart';
import 'package:flutter_capstone/services/detail/detail_service.dart';

class DetailViewModel extends ChangeNotifier {
  DetailModel? _detailOffice;

  DetailModel? get detailData => _detailOffice;

  Future<void> getOfficeDetail(int id) async {
    try {
      final response = await DetailService.getDetail(id);

      if (response.statusCode == 200) {
        final responseData = response.data['data'];
        _detailOffice = DetailModel.fromJson(responseData);
        notifyListeners();
      } else {
        throw Exception(
            'Gagal memuat detail office. Error code : ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Gagal memuat detail office : $error');
    }
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
