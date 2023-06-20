import 'package:dio/dio.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/model/edit_profile/edit_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileService {
  final Dio _dio = Dio();

  Future<Profile?> putProfileData(Map<String, String?> data, int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    try {
      final response = await _dio.put(
        '$baseUrl/api/v1/user/edit',
        data: data,
        options: Options(
          validateStatus: (_) => true,
          headers: {
            "accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = response.data;
        final profile = Profile.fromJson(responseData);
        return profile;
      } else {
        throw Exception(
            'Failed to fetch edit profile data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to fetch edit profile data: $error');
    }
  }
}
