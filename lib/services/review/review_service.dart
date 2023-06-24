// ignore_for_file: deprecated_member_use, avoid_print, prefer_typing_uninitialized_variables, use_build_context_synchronously, unused_local_variable, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/widgets/modal_bottom.dart';

class ReviewService {
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
            'Authorization': 'Bearer $token',
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
        return modalBottomSheet(
          context,
          img: 'assets/images/rating/success_to_rate.png',
          title: 'Yey, kamu berhasil menilai office!',
          desc:
              'Selamat! kamu berhasil menilai office! Silahkan lanjutkan submit!',
          path: () {
            Navigator.pushReplacementNamed(context, '/bottom-nav');
          },
          buttonText: 'Okay!',
        );
      }
    } on DioError catch (e) {
      print(e.response?.data);
      if (e.response!.statusCode == 500) {
        return modalBottomSheet(
          context,
          img: 'assets/images/modal_bottom/retro_mac.png',
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
