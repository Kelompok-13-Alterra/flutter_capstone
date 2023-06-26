// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/model/login/login_model.dart';

class LoginService {
  Future<LoginModel> postLogin({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await Dio().post('$baseUrl/api/v1/auth/login',
          options: Options(headers: {
            "accept": "application/json",
            "Content-Type": "application/json",
          }),
          data: {
            "email": email,
            "password": password,
          });
      return LoginModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
