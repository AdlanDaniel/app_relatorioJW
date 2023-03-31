import 'package:dio/dio.dart';
import 'package:relatorio_jw_app/app/core/local_storage/local_storage_repository.dart';

class AuthInterceptor implements Interceptor {
  final LocalStorageRepository _localStorage;

  AuthInterceptor(this._localStorage);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final isAuthHeader = options.extra['authHeader'];
    if (isAuthHeader) {
      final accessToken = await _localStorage.getJwtToken();
      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    } else {
      options.headers.remove('Authorization');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
