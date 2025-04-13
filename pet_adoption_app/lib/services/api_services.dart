import 'package:dio/dio.dart';

class ApiServices{
  static late Dio dio;

  static void initialize() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://simple-pets.onrender.com/',
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 10),
    ));
  }

  static Future<Response> post(String lasturl, dynamic data) async {
    return await dio.post(lasturl, data: data);
  }
  
}

