// ignore_for_file: unnecessary_null_in_if_null_operators, deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/model/notification/notification_model.dart';

class NotificationService {
  // Get list office
  Future<NotificationModel> getNotification() async {
    String token = await getToken();

    try {
      final response = await Dio().get(
        '$baseUrl/api/v1/notification',
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': "aplication/json",
            'Authorization': 'Bearer $token'
          },
        ),
      );
      return NotificationModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
