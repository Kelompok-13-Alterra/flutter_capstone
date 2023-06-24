// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/model/order/booked_model.dart';

class BookedService {
  final Dio _dio = Dio();

  Future<List<Booked>> fetchBookedData() async {
    String token = await getToken();
    try {
      final response = await _dio.get('$baseUrl/api/v1/transaction/booked',
          options: Options(headers: {
            "accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));

      if (response.statusCode == 200 || response.statusCode == 201) {
        BookedModel booked = BookedModel.fromJson(response.data);
        if (booked.data.isEmpty) {
          return [];
        }
        return booked.data;
      } else {
        throw Exception('Failed to fetch booked data');
      }
    } catch (error) {
      throw Exception('Failed to fetch booked data: $error');
    }
  }
}
