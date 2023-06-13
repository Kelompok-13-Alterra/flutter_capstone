// ignore_for_file: deprecated_member_use, avoid_print, prefer_typing_uninitialized_variables, use_build_context_synchronously, unused_local_variable, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_capstone/init/const/api.dart';
import 'package:flutter_capstone/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/screens/modal_bottom.dart';

class ReviewService {
  // int transactionId = 21;

  Future<void> addPosted(
    BuildContext context, {
    required int transactionId,
    required double star,
    required String description,
    required List<String> tags,
  }) async {
    String token = await getToken();
    try {
      final response = await Dio().post('$baseUrl/api/v1/rating/$transactionId',
          options: Options(headers: {
            'accept': 'application/json',
            'Content-Type': "aplication/json",
            'Authorization':
                // 'Bearer $token'
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InVsZmFsZHl5QGdtYWlsLmNvbSIsImlkIjo3LCJpc192ZXJpZnkiOmZhbHNlLCJyb2xlIjowfQ.IriX0fkwCCt_u9dZAXO-muMuq_76XhcyROPXGCwNYpE'
          }),
          data: jsonEncode({
            "description": description,
            "star": star,
            "tags": tags,
          }));
      print("id : ${transactionId}");
      print("desc : ${description}}");
      print("star : ${star}");
      print("tags : ${tags}");
      if (response.statusCode == 201) {
        print("Berhasil ${response.data}");
        return ModalBottomSheet(
          context,
          img: 'assets/image/success_to_rate.png',
          title: 'Yey, kamu berhasil menilai office!',
          desc:
              'Selamat! kamu berhasil menilai office! Silahkan lanjutkan submit!',
          path: () {
            Navigator.pushReplacementNamed(context, '/order');
          },
          buttonText: 'Okay!',
        );
        // return ReviewModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.response?.data);
      if (e.response!.statusCode == 500) {
        return ModalBottomSheet(
          context,
          img: 'assets/retro_mac.png',
          title: 'Waduh?!',
          desc: 'Kamu sudah melakukan review',
          path: () {
            Navigator.pop(context);
          },
          buttonText: 'Okay!',
        );
      }
      throw Exception(e);
    }
  }
}


  // var headers = {
  //   'accept': 'application/json',
  //   'Content-Type': "aplication/json",
  //   'Authorization': 'Bearer ${getToken()}'
  // };

  // Future<void> addPost(
  //     double star, String description, List<String> tags) async {
  //   String token = await getToken();
  //   var headers = {
  //     'accept': 'application/json',
  //     'Content-Type': "aplication/json",
  //     'Authorization': 'Bearer $token'
  //   };
  //   final data = {
  //     "star": star,
  //     "description": description,
  //     "tags": tags,
  //   };
  //   try {
  //     final response = await Dio().post(
  //       '$baseUrl/api/v1/rating/$transactionId',
  //       data: data,
  //       options: Options(headers: headers
  //           // {
  //           //   'accept': 'application/json',
  //           //   'Content-Type': "aplication/json",
  //           //   'Authorization': 'Bearer $token',
  //           // }
  //           ),
  //     );
  //     debugPrint('post : ${response.data}');
  //     debugPrint('post : ${response.statusMessage}');
  //     return response.data;
  //   } catch (e) {
  //     debugPrint('exception $e');
  //   }
  // }
  // showModalBottomSheet(
  //   context: context,
  //   isScrollControlled: true,
  //   backgroundColor: SourceColor().white,
  //   enableDrag: false,
  //   isDismissible: false,
  //   shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(
  //     top: Radius.circular(10),
  //   )),
  //   builder: (context) {
  //     return FractionallySizedBox(
  //       heightFactor: 309,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.only(
  //               top: 55.71,
  //               bottom: 41.91,
  //             ),
  //             child: Image.asset(
  //               "assets/image/success_to_rate.png",
  //               width: 59.38,
  //               height: 59.38,
  //             ),
  //           ),
  //           Text(
  //             "Yey, kamu berhasil menilai office!",
  //             style: setTextStyle(NeutralColor().neutral17).copyWith(
  //               fontSize: 16,
  //               fontWeight: medium,
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 4,
  //           ),
  //           Text(
  //             "Selamat! kamu berhasil menilai office! Silahkan lanjutkan submit!",
  //             style: setTextStyle(NeutralColor().neutral17).copyWith(
  //               fontSize: 12,
  //               fontWeight: regular,
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 16,
  //           ),
  //           ElevatedButton(
  //             onPressed: () {},
  //             style: ElevatedButton.styleFrom(
  //               fixedSize: const Size(365, 50),
  //               backgroundColor: PrimaryColor().primary,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(100),
  //               ),
  //             ),
  //             child: const Center(
  //               child: Padding(
  //                 padding: EdgeInsets.only(
  //                   top: 15,
  //                   bottom: 15,
  //                 ),
  //                 child: Text("Okay!"),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   },
  // );
  // Service for post review
  // Future postReview(
  //   int star,
  //   String description,
  // ) async {
  //   try {
  //     var response = await Dio().post('$baseUrl/api/v1/rating/$transactionId',
  //         options: Options(headers: headers),
  //         data: {
  //           'star': star,
  //           'description': description,
  //         });
  //     if (response.statusCode == 200) {
  //       return
  //           //ReviewModel(
  //           Data(
  //         star: response.data['star'],
  //         description: response.data['description'],
  //       );
  //       // );
  //     }
  //     print(response.data.toString());
  //     return Data;
  //   } on DioError catch (e) {
  //     return e.response!.data;
  //   }
  // }
  // Future postReview(
  //   int star,
  //   String description,
  // ) async {
  //   try {
  //     Response response = await Dio().post(
  //       '$baseUrl/api/v1/rating/$transactionId',
  //       options: Options(
  //         headers: {
  //           "accept": "application/json",
  //           "Content-Type": "application/json",
  //           "Authorization":
  //               "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InVsZmFsZHl5QGdtYWlsLmNvbSIsImlkIjo3LCJpc192ZXJpZnkiOmZhbHNlLCJyb2xlIjowfQ.IriX0fkwCCt_u9dZAXO-muMuq_76XhcyROPXGCwNYpE",
  //         },
  //       ),
  //       data: {
  //         "star": star,
  //         "description": description,
  //         // "star": 5,
  //         // "description":
  //         //     "Coworking nya bagus sesuai harapan kami, karena fasilitas yang diberikan lengkap.",
  //       },
  //     );
  //     // if (response.statusCode == 200) {
  //     //   return ReviewModel(data: Data(star: star, description: description));
  //     // }
  //     // print(response.statusCode);
  //     print(response.data.toString());
  //     return response.data;
  //   } on DioError catch (e) {
  //     print(e);
  //     return e.response!.data;
  //   }
  // }

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
