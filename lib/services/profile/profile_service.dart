// ignore_for_file: unused_catch_clause, empty_catches, deprecated_member_use, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/model/profile/profile_model.dart';

class ProfileService extends ChangeNotifier {
  Future getProfile() async {
    String token = await getToken();
    try {
      final response = await Dio().get(
        '$baseUrl/api/v1/user/me',
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': "aplication/json",
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print("Profile : ${response.data}");

      notifyListeners();
      if (response.statusCode == 200) {
        return ProfileModel.fromJson(response.data);
      } else {
        throw Exception(
            'Gagal memuat detail office. Error code : ${response.statusCode}');
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

    Future<ProfileModel> profile() async {
    String token = await getToken();
    try {
      final response = await Dio().get(
        '$baseUrl/api/v1/user/me',
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': "aplication/json",
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print("Profile : ${response.data}");

      if (response.statusCode == 200) {
        return ProfileModel.fromJson(response.data);
      } else {
        throw Exception(
            'Gagal memuat detail office. Error code : ${response.statusCode}');
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
