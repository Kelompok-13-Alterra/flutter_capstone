// ignore_for_file: avoid_print, unused_local_variable, deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter_capstone/init/const/api.dart';
import 'package:flutter_capstone/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/model/search_office/search_model.dart';

class SearchService {
  // Get list office
  Future<SearchModel> getSearch(String searchLocation) async {
    String token = await getToken();

    var headers = {
      'accept': 'application/json',
      'Content-Type': "aplication/json",
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InVsZmFsZHl5QGdtYWlsLmNvbSIsImlkIjo3LCJpc192ZXJpZnkiOmZhbHNlLCJyb2xlIjowfQ.IriX0fkwCCt_u9dZAXO-muMuq_76XhcyROPXGCwNYpE'
    };
    try {
      final response = await Dio().get(
        '$baseUrl/api/v1/office?location=$searchLocation',
        options: Options(headers: headers),
      );

      print(response.data);
      return SearchModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      throw Exception('Failed get list of office $e');
    }
  }
}
