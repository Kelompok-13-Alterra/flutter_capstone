// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/model/home/home_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeService {
  final Dio _dio = Dio();

  Future<List<Office>> fetchHomeData() async {
    String token = await getToken();
    try {
      final response = await _dio.get('$baseUrl/api/v1/office',
          options: Options(headers: {
            "accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        HomeModel offices = HomeModel.fromJson(response.data);
        return offices.data;
      } else {
        throw Exception('Failed to fetch home data');
      }
    } catch (error) {
      throw Exception('Failed to fetch home data: $error');
    }
  }
}
