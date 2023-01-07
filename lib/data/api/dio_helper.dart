import 'package:dio/dio.dart';
import 'package:todo_app_flutter/data/api/api.dart';

class DioHelper {
  static DioHelper? _instance = DioHelper._internal();

  DioHelper._internal();

  factory DioHelper() {
    _instance ??= DioHelper._internal();
    return _instance!;
  }

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Api.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  )..interceptors.addAll(
      [
        LogInterceptor(
          request: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
        )
      ],
    );
  Dio get dio => _dio;

  // void addToken(String token) {
  //   _dio.options.headers['Authorization'] = "Bearer $token";
  // }

  // void onLogout() {
  //   _dio.options.headers['Authorization'] = null;
  // }
}
