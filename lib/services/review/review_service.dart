// ignore_for_file: deprecated_member_use, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_capstone/init/const/api.dart';
// import 'package:flutter_capstone/init/utils/shared_preferences.dart';
// import 'package:flutter_capstone/model/review/review_model.dart';

class ReviewService {
  int transactionId = 0;
  // Service for post review
  Future postReview({
    required int star,
    required String description,
  }) async {
    try {
      Response response = await Dio().post(
        '$baseUrl/api/v1/rating/22',
        options: Options(
          headers: {
            "accept": "application/json",
            "Content-Type": "application/json",
          },
        ),
        data: {
          // "star": star,
          // "description": description,
          "star": 5,
          "description":
              "Coworking nya bagus sesuai harapan kami, karena fasilitas yang diberikan lengkap.",
        },
      );
      print(response.statusCode);
      print(response.data.toString());
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  // Service for get data review user
  // Future<ReviewModel> getDataRewiew() async {
  //   try {
  //     Response response = await Dio().get(
  //       '$baseUrl/api/v1/rating/22',
  //       options: Options(
  //         headers: {
  //           "accept": "application/json",
  //           "Content-Type": "application/json",
  //           "Authorization": "Bearer $getToken()",
  //         },
  //       ),
  //     );
  //     return ReviewModel.fromJson(response.data);
  //   } on DioError catch (e) {
  //     return e.response!.data;
  //   }
  // }
}
