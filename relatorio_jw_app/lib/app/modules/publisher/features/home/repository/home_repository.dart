import 'package:equatable/equatable.dart';
import 'package:relatorio_jw_app/app/core/http_client/response_rest_client.dart';
import 'package:relatorio_jw_app/app/core/http_client/rest_client.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/repository/models/user_publisher.dart';

abstract class HomeRepository {
  Future<UserPublisher> getPublisher();
  Future<void> signOut();
}

class HomeRepositoryImpl implements HomeRepository {
  RestClient restClient;
  HomeRepositoryImpl({
    required this.restClient,
  });

  @override
  Future<UserPublisher> getPublisher() async {
    try {
      RestClientResponse response = await restClient.get('/v1/publisher/me');
      return UserPublisher.fromMap(response.data);
    } on HttpError catch (e) {
      switch (e.errorType) {
        case ErrorType.networkError:
          throw HomeRepositoryNetworkError();
        case ErrorType.serverError:
          throw HomeRepositoryServerError();
        case ErrorType.clientError:
          throw HomeRepositoryClientError();
        default:
          throw HomeRepositoryGenericError();
      }
    } catch (_) {
      throw HomeRepositoryGenericError();
    }
  }

  @override
  Future<void> signOut() async {
    try {
      final response = await restClient.post('/v1/auth/logout');

      print(response.statusCode);
      print(response.statusMessage);
    } on HttpError catch (e) {
      switch (e.errorType) {
        case ErrorType.networkError:
          throw HomeRepositoryNetworkError();
        case ErrorType.clientError:
          throw HomeRepositoryClientError();
        case ErrorType.serverError:
          throw HomeRepositoryServerError();

        default:
          throw HomeRepositoryGenericError;
      }
    } catch (_) {
      throw HomeRepositoryGenericError();
    }
  }
}

abstract class HomeRepositoryError extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

class HomeRepositoryNetworkError extends HomeRepositoryError {}

class HomeRepositoryClientError extends HomeRepositoryError {}

class HomeRepositoryServerError extends HomeRepositoryError {}

class HomeRepositoryGenericError extends HomeRepositoryError {}
