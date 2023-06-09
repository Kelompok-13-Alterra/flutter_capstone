import 'package:dio/dio.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/model/login/login_model.dart';

class LoginService {
  Future postLogin({
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
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  // Future<LoginModel> getDataUser() async {
  //   try {
  //     Response response = await Dio().get(
  //       '$baseUrl/api/v1/auth/login',
  //       options: Options(headers: {
  //         "accept": "application/json",
  //         "Content-Type": "application/json",
  //         "Authorization": "Bearer ${getToken()}"
  //       }),
  //     );

  //     return LoginModel.fromJson(response.data);
  //   } on DioError catch (e) {
  //     return e.response!.data;
  //   }
  // }
}
