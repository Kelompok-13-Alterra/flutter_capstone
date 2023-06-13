//Check if the date available or not
// ignore_for_file: unused_import, avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/model/booking/booking_availability_model.dart';
import 'package:flutter_capstone/model/order/order_model.dart';
import 'package:flutter_capstone/screens/booking/booking_screen.dart';
import 'package:flutter_capstone/screens/errors/page_not_found.dart';
import 'package:flutter_capstone/widgets/modal_bottom.dart';
import 'package:flutter_capstone/screens/payment/detail_payment_screen.dart';

class BookingAvailabilityService {
  Future<BookingAvailabilityModel> checkDate(
    BuildContext context, {
    required int officeId,
    required String startDate,
    required String endDate,
  }) async {
    String token = await getToken();
    try {
      final response = await Dio().post(
          '$baseUrl/api/v1/transaction/office/$officeId/availability-check',
          options: Options(headers: {
            'accept': 'application/json',
            'Authorization': 'Bearer $token',
            'Content-Type': "aplication/json",
          }),
          data: jsonEncode({
            "start": startDate,
            "end": endDate,
          }));
      return BookingAvailabilityModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      if (e.response!.statusCode == 500) {
        print('Catched');
        // ignore: use_build_context_synchronously
        return ModalBottomSheet(context,
            img: 'assets/images/modal_bottom/retro_mac_error.png',
            title: 'Waduh?!',
            desc:
                'Tanggal yang kamu pilih tidak tersedia. Coba pilih\ntanggal yang lain.',
            path: () {
          // Navigator.pop(context);
          Navigator.pushReplacementNamed(context, '/booking');
        }, buttonText: 'Pilih tanggal lain');
      } else if (e.response!.statusCode == 400) {
        // return const PageNotFoundScreen();
      }
      throw Exception(e);
    }
  }
}
