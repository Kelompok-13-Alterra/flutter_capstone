import 'package:dio/dio.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/model/midtrans/midtrans_model.dart';

class MidtransService {
  Future<MidtransPaymentModel> getPayment({required int transactionId}) async {
    String token = await getToken();

    var headers = {
      'accept': 'application/json',
      'Content-Type': "aplication/json",
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await Dio().get(
        '$baseUrl/api/v1/transaction/$transactionId/payment-detail',
        options: Options(headers: headers),
      );
      print(response.data);
      return MidtransPaymentModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      throw Exception('Failed get list of office $e');
    }
  }
}
