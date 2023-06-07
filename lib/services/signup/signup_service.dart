
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/model/signup/signup_model.dart';
import 'package:flutter_capstone/screens/login/login_screen.dart';


class SignupService {

  Future postSignup({
    required String id,
    required String email,
    required String username,
    required String password,

  }) async {
    try {
      Response response = await Dio().post('$baseUrl/api/v1/auth/register',
          options: Options(headers: {
            "accept": "application/json",
            "Content-Type": "application/json",
          }),
          data: {
            "email": email,
            "name":username,
            "password": password,
          });
          if(response.data == 200 || response.statusCode == 201){
            print('sukses');
          }else{
            var errorMessage = response.data['meta']['message'];
      print('Registrasi gagal: $errorMessage');
          }
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<SignupModel> getDataUser() async {
    try {
      Response response = await Dio().get(
        '$baseUrl/api/v1/auth/register',
        options: Options(headers: {
          "accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $getToken()"
        }),
      );

      return SignupModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
