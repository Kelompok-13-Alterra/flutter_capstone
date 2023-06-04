import 'package:dio/dio.dart';
import 'package:flutter_capstone/screens/home/model/home_model.dart';

class HomeService {
  final Dio _dio = Dio();

  Future<List<Office>> fetchHomeData() async {
    try {
      final response =
          await _dio.get('http://34.101.193.55:8080/api/v1/office');
      if (response.statusCode == 200) {
        HomeModel offices = HomeModel.fromJson(response.data);
        return offices.data;
      } else {
        throw Exception('Failed to fetch home data');
      }
    } catch (error) {
      throw Exception('Failed to fetch home data: $error');
    }
  }
}
