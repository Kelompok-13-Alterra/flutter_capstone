// ignore_for_file: unused_catch_clause, empty_catches, deprecated_member_use, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/model/profile/profile_model.dart';

class ProfileService {
  Future<ProfileModel> getProfile() async {
    String token = await getToken();
    try {
      final response = await Dio().get('$baseUrl/api/v1/user/me',
          options: Options(headers: {
            'accept': 'application/json',
            'Content-Type': "aplication/json",
            'Authorization': 'Bearer $token',
          }));
      print("Profile : ${response.data}");
      return ProfileModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
