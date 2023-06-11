import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/model/order/order_model.dart';

class OrderService {
  // Get list office
  Future<OrderModel> createOrder({
    required int officeId,
    required String startDate,
    required String endDate,
    required String paymentId,
  }) async {
    String token = await getToken();
    try {
      final response =
          await Dio().post('$baseUrl/api/v1/transaction/office/$officeId/book',
              options: Options(headers: {
                'accept': 'application/json',
                'Content-Type': "aplication/json",
                'Authorization': 'Bearer $token'
              }),
              data: json.encode({
                "end": endDate,
                "paymentID": paymentId,
                "start": startDate,
              }));
      return OrderModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
