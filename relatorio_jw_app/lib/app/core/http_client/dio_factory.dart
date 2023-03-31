import 'package:dio/dio.dart';

//**
// This class will not be used at time
// */

class DioFactory {
  static Dio create({
    required String baseUrl,
    int connectTimeout = 5000,
    int receiveTimeout = 3000,
  }) {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
    return Dio(options);
  }
}
