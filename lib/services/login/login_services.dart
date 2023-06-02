import 'package:dio/dio.dart';
import 'package:flutter_capstone/const/api.dart';
import 'package:flutter_capstone/model/login/login_model.dart';

class LoginService {
  Future postLogin({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await Dio().post('$baseUrl/auth/login',
          options: Options(headers: {
            "accept": "application/json",
            "Content-Type": "application/json",
          }),
          data: {
            "email": email,
            "password": password,
          });

      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
