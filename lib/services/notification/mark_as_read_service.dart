// ignore_for_file: unnecessary_null_in_if_null_operators, deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/model/notification/mark_as_read.dart';

class MarkAsReadService {
  // Get list office
  Future<MarkAsReadModel> markNotification() async {
    String token = await getToken();

    try {
      final response = await Dio().put(
        '$baseUrl/api/v1/notification/mark-as-read',
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': "aplication/json",
            'Authorization': 'Bearer $token'
          },
        ),
      );
      print(response.data);
      return MarkAsReadModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
