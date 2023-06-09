//Check if the date available or not
// ignore_for_file: deprecated_member_use, unnecessary_null_in_if_null_operators, use_build_context_synchronously

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/model/booking/booking_availability_model.dart';
import 'package:flutter_capstone/screens/booking/booking_screen.dart';
import 'package:flutter_capstone/widgets/modal_bottom.dart';

class BookingAvailabilityService {
  Future<BookingAvailabilityModel?> checkDate(
    BuildContext context, {
    required int officeId,
    required String startDate,
    required String endDate,
  }) async {
    final args =
        ModalRoute.of(context)?.settings.arguments as BookingScheduleArgument;
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
      if (e.response!.statusCode == 500) {
        var selectedDateRange = args.selectedDateRange ?? null;
        return modalBottomSheet(context,
            img: 'assets/images/modal_bottom/retro_mac_error.png',
            title: 'Waduh?!',
            desc:
                'Tanggal yang kamu pilih tidak tersedia. Coba pilih\ntanggal yang lain.',
            path: () {
          Navigator.pop(context, selectedDateRange);
        }, buttonText: 'Pilih tanggal lain');
      } else if (e.response!.statusCode == 400) {}
      throw Exception(e);
    }
  }
}
