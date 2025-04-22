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


  static Future<void> barearToken(String token)async{
    dio.options.headers["Authorization"]="Bearer $token";  
  }

  static Future<Response> post(String lasturl, dynamic data) async {
    return await dio.post(lasturl, data: data);
  }

  static Future<Response> put(String lasturl, dynamic data)async{
    return await dio.put(lasturl,data: data);
  }
  static Future<Response>get(String lasturl)async{
    return await dio.get(lasturl,);
  }
  
}

