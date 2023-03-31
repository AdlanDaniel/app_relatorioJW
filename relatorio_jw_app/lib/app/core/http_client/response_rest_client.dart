import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class RestClientResponse<T> extends Equatable {
  final T? data;
  final int? statusCode;
  final String? statusMessage;
  final ResponseType type;
  final Map<String, List<String>> headers;

  const RestClientResponse({
    this.statusCode,
    this.type = ResponseType.json,
    this.data,
    this.headers = const {},
    this.statusMessage,
  });

  @override
  List<Object?> get props => [
        data,
        type,
        headers,
        statusCode,
        statusMessage,
      ];
}

enum ErrorType {
  networkError,
  clientError,
  serverError,
  unknown,
}

class HttpError extends Equatable implements Exception {
  final ErrorType errorType;

  const HttpError({
    this.errorType = ErrorType.networkError,
  });

  bool get isNetworkError => errorType == ErrorType.networkError;

  @override
  List<Object?> get props => [errorType];
}

class HttpResponseError extends HttpError {
  final RestClientResponse response;

  HttpResponseError(this.response)
      : super(
          errorType: () {
            if (response.statusCode! >= 400 && response.statusCode! <= 499) {
              return ErrorType.clientError;
            }

            if (response.statusCode! >= 500 && response.statusCode! <= 599) {
              return ErrorType.serverError;
            }

            return ErrorType.unknown;
          }(),
        );

  @override
  List<Object?> get props => [
        ...super.props,
        response,
      ];
}
