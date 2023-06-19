import 'package:dio/dio.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'dart:convert';

class RescheduleService {
  Future updateTransactionSchedule(int id, String start, String end) async {
    String token = await getToken();
    final url = '$baseUrl/api/v1/transaction/$id/reschedule';
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final data = jsonEncode({'start': start, 'end': end});

    final dio = Dio();

    try {
      final response =
          await dio.put(url, data: data, options: Options(headers: headers));

      return response;
    } catch (error) {
      rethrow;
    }
  }
}
