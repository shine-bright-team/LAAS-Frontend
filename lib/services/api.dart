import 'package:dio/dio.dart';

class Api {
  static BaseOptions baseURL = BaseOptions(baseUrl: "http://localhost:8000/");
  static Dio dio = Dio(baseURL);

  static setToken(String token) {
    dio.options.headers["Authorization"] = "Bearer $token";
  }
}
