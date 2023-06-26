// ignore_for_file: avoid_print, unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/model/search_office/search_model.dart';

class SearchService {
  // Get list office
  Future<SearchModel> getSearch(String searchLocation) async {
    String token = await getToken();

    var headers = {
      'accept': 'application/json',
      'Content-Type': "aplication/json",
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await Dio().get(
        '$baseUrl/api/v1/office?location=$searchLocation',
        options: Options(headers: headers),
      );

      return SearchModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed get list of office $e');
    }
  }
}
