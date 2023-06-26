// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/model/order/history_model.dart';

class HistoryService {
  final Dio _dio = Dio();

  Future<List<History>> fetchHistoryData() async {
    String token = await getToken();
    try {
      final response = await _dio.get('$baseUrl/api/v1/transaction/history',
          options: Options(headers: {
            "accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = response.data;
        // Log the response data for debugging

        HistoryModel history = HistoryModel.fromJson(responseData);
        if (history.data.isEmpty) {
          return [];
        }
        return history.data;
      } else {
        throw Exception(
            'Failed to fetch history data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to fetch history data: $error');
    }
  }
}
