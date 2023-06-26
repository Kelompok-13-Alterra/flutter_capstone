import 'package:dio/dio.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/core/init/const/api.dart';

class DetailService {
  static final Dio _dio = Dio();

  static Future<Response> getDetail(int? id) async {
    String token = await getToken();
    try {
      final response = await _dio.get(
        '$baseUrl/api/v1/office/$id',
        options: Options(
          headers: {
            "accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
