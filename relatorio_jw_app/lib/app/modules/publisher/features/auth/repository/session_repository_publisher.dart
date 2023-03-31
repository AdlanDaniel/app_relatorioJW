import 'package:equatable/equatable.dart';
import 'package:relatorio_jw_app/app/core/http_client/response_rest_client.dart';
import 'package:relatorio_jw_app/app/core/http_client/rest_client.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/repository/models/user_publisher.dart';

abstract class AuthRepository {
  Future<void> registerPublisher(UserPublisher userPublisher);
  Future<String> signInPublisher(UserPublisher userPublisher);
}

class AuthRepositoryImpl implements AuthRepository {
  RestClient restClient;
  AuthRepositoryImpl({
    required this.restClient,
  });

  @override
  Future<void> registerPublisher(UserPublisher userPublisher) async {
    try {
      await restClient.post('/v1/publisher/create',
          data: userPublisher.toMap());
    } on HttpError catch (e) {
      switch (e.errorType) {
        case ErrorType.networkError:
          throw AuthRepositoryNetworkError();

        case ErrorType.clientError:
          throw AuthRepositoryClientError();

        case ErrorType.serverError:
          throw AuthRepositoryServerError();

        default:
          AuthRepositoryGenericError();
      }
    } catch (_) {
      throw AuthRepositoryGenericError();
    }
  }

  @override
  Future<String> signInPublisher(UserPublisher userPublisher) async {
    try {
      final response =
          await restClient.post('/v1/auth/login', data: userPublisher.toMap());
      final token = response.data['access_token'] as String;

      return token;
    } on HttpError catch (e) {
      switch (e.errorType) {
        case ErrorType.networkError:
          throw AuthRepositoryNetworkError();

        case ErrorType.clientError:
          throw AuthRepositoryClientError();

        case ErrorType.serverError:
          throw AuthRepositoryServerError();

        default:
          throw AuthRepositoryGenericError();
      }
    } catch (_) {
      throw AuthRepositoryGenericError();
    }
  }
}

abstract class AuthRepositoryError extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

class AuthRepositoryNetworkError extends AuthRepositoryError {}

class AuthRepositoryClientError extends AuthRepositoryError {}

class AuthRepositoryServerError extends AuthRepositoryError {}

class AuthRepositoryGenericError extends AuthRepositoryError {}
