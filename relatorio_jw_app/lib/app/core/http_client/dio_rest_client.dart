import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:get/get.dart' as g;
import 'package:relatorio_jw_app/app/core/environment/environment.dart';
import 'package:relatorio_jw_app/app/core/http_client/response_rest_client.dart';
import 'package:relatorio_jw_app/app/core/http_client/rest_client.dart';
import 'package:relatorio_jw_app/app/core/interceptors/interceptors.dart';
import 'package:relatorio_jw_app/app/core/local_storage/local_storage_repository.dart';

class DioRestClient implements RestClient {
  late Dio _dio;

  final _options = BaseOptions(
    baseUrl: g.Get.find<Environment>().baseUrl,
    connectTimeout: int.parse(g.Get.find<Environment>().connectTimeout),
    receiveTimeout: int.parse(g.Get.find<Environment>().receiveTimeout),
  );

  DioRestClient({
    BaseOptions? options,
    required LocalStorageRepository localStorage,
  }) {
    _dio = Dio(options ?? _options);
    _dio.interceptors.addAll([
      dioLoggerInterceptor,
      AuthInterceptor(localStorage),
    ]);
  }

  @override
  Future<RestClientResponse<T>> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isAuthHeader = true,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        queryParameters: queryParameters,
        options: Options(
          extra: {'authHeader': isAuthHeader},
          headers: headers,
        ),
      );

      return RestClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e) {
      if (e.response == null) {
        throw HttpError(
            errorType: e.error is SocketException
                ? ErrorType.networkError
                : ErrorType.serverError);
      } else {
        throw HttpResponseError(_dioErrorConverter(e.response));
      }
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isAuthHeader = true,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          extra: {'authHeader': isAuthHeader},
          headers: headers,
        ),
      );

      return RestClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e) {
      if (e.response == null) {
        throw HttpError(
            errorType: e.error is SocketException
                ? ErrorType.networkError
                : ErrorType.serverError);
      } else {
        throw HttpResponseError(_dioErrorConverter(e.response));
      }
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isAuthHeader = true,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          extra: {'authHeader': isAuthHeader},
          headers: headers,
        ),
      );

      return RestClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e) {
      if (e.response == null) {
        throw HttpError(
            errorType: e.error is SocketException
                ? ErrorType.networkError
                : ErrorType.serverError);
      } else {
        throw HttpResponseError(_dioErrorConverter(e.response));
      }
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isAuthHeader = true,
  }) async {
    try {
      final response = await _dio.post(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
            extra: {'authHeader': isAuthHeader},
          ));

      return RestClientResponse(
        data: response.data,
        statusCode: response.statusCode!,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e) {
      if (e.response == null) {
        throw HttpError(
            errorType: e.error is SocketException
                ? ErrorType.networkError
                : ErrorType.serverError);
      } else {
        throw HttpResponseError(_dioErrorConverter(e.response));
      }
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isAuthHeader = true,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          extra: {'authHeader': isAuthHeader},
          headers: headers,
        ),
      );

      return RestClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e) {
      if (e.response == null) {
        throw HttpError(
            errorType: e.error is SocketException
                ? ErrorType.networkError
                : ErrorType.serverError);
      } else {
        throw HttpResponseError(_dioErrorConverter(e.response));
      }
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(
    String path, {
    data,
    required String method,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isAuthHeader = true,
  }) async {
    try {
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          extra: {'authHeader': isAuthHeader},
          headers: headers,
        ),
      );

      return RestClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e) {
      if (e.response == null) {
        throw HttpError(
            errorType: e.error is SocketException
                ? ErrorType.networkError
                : ErrorType.serverError);
      } else {
        throw HttpResponseError(_dioErrorConverter(e.response));
      }
    }
  }

  RestClientResponse<T> _dioErrorConverter<T>(Response? response) {
    return RestClientResponse(
      data: response?.data,
      statusMessage: response?.statusMessage,
      statusCode: response?.statusCode,
    );
  }
}
