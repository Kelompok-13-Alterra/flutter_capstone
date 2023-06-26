// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter_capstone/core/init/const/api.dart';

class SignUpService {
  Future postSignup({
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
            "name": username,
            "password": password,
          });
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
