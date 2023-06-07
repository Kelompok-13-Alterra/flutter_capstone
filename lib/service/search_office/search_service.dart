// ignore_for_file: avoid_print, unused_local_variable

import 'dart:convert';

import 'package:flutter_capstone/const/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_capstone/model/search_office/search_model.dart';
import 'package:flutter_capstone/utils/shared_preferences.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class SearchService {
  // List<Datum> results = [];
  // var data = [];
  // Get list od office
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

  // Future<List<Datum>> getS(String searchName, {String? searchLocation, String? query}) async {
  //   String token = await getToken();

  //   var headers = {
  //     'accept': 'application/json',
  //     'Content-Type': "aplication/json",
  //     'Authorization':
  //         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InVsZmFsZHl5QGdtYWlsLmNvbSIsImlkIjo3LCJpc192ZXJpZnkiOmZhbHNlLCJyb2xlIjowfQ.IriX0fkwCCt_u9dZAXO-muMuq_76XhcyROPXGCwNYpE'
  //   };
  //   try {
  //     final response = await Dio().get(
  //       '$baseUrl/api/v1/office?location=$searchLocation',
  //       options: Options(headers: headers),
  //     );
  //     if (response.statusCode == 200) {
  //       data = json.decode(response.data);
  //       results = data.map((e) => Datum.fromJson(e)).toList();
  //       if (query != null) {
  //         results = results
  //             .where((element) =>
  //                 element.location!.toLowerCase().contains(query.toLowerCase()))
  //             .toList();
  //       } else {
  //         print('fetch error');
  //       }
  //     }
  //     // return
  //     //SearchModel.fromJson(response.data);
  //   } on DioError catch (e) {
  //     print(e);
  //     throw Exception('Failed get list of office $e');
  //   }
  //   return results;
  // }
}

// if (response.statusCode == 200) {

// } else {
//   print('Required failed with status : ${response.statusCode}');
// }

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
