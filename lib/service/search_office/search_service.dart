// ignore_for_file: avoid_print

import 'package:flutter_capstone/const/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_capstone/model/search_office/search_model.dart';

class SearchService {
  // Get list od office
  Future<SearchModel> getSearch() async {
    var headers = {
      'accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InVsZmFsZHl5QGdtYWlsLmNvbSIsImlkIjo3LCJpc192ZXJpZnkiOmZhbHNlLCJyb2xlIjowfQ.IriX0fkwCCt_u9dZAXO-muMuq_76XhcyROPXGCwNYpE'
    };
    try {
      final response = await Dio().get(
        '$baseUrl/api/v1/office',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        var data = response.data;
        print(data);
      } else {
        print('Required failed with status : ${response.statusCode}');
      }

      return SearchModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      throw Exception('Failed get list of office $e');
    }
  }
  //   Future<SearchModel> getSearch() async {
  //   try {
  //     final response = await Dio().get('$baseUrl/api/v1/office');
  //     print(response.data);

  //     if (response.statusCode == 200) {
  //       getToken;
  //     }

  //     return SearchModel.fromJson(response.data);
  //   } on DioError catch (e) {
  //     throw Exception('Failed get list of office $e');
  //   }
  // }
}


  // Future<List<OfficeListModel>> getOfficeList() async {
  //   final response = await Dio().get('$baseUrl/api/v1/office');

  //   List<OfficeListModel> office = (response.data as List)
  //       .map(
  //         (e) => OfficeListModel(
  //           data: e["data"],
  //         ),
  //       )
  //       .toList();
  //   print(response.data);
  //   return office;
  // }