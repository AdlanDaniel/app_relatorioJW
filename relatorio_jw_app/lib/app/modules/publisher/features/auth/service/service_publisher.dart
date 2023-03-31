import 'package:equatable/equatable.dart';

import 'package:relatorio_jw_app/app/core/local_storage/local_storage_repository.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/repository/models/user_publisher.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/repository/session_repository_publisher.dart';

class AuthService {
  AuthRepository repositoryPublisher;
  LocalStorageRepository localStorageRepository;
  AuthService(
      {required this.repositoryPublisher,
      required this.localStorageRepository});

  Future registerPublisher(UserPublisher userPublisher) async {
    try {
      await repositoryPublisher.registerPublisher(userPublisher);
    } on AuthRepositoryNetworkError {
      throw AuthServiceNetworkError();
    } on AuthRepositoryClientError {
      throw AuthServiceClientError();
    } on AuthRepositoryServerError {
      throw AuthServiceServerError();
    } on AuthRepositoryGenericError {
      throw AuthServiceGenericError;
    }
  }

  Future<void> signIn(UserPublisher userPublisher) async {
    try {
      final acessToken =
          await repositoryPublisher.signInPublisher(userPublisher);
      print(acessToken);
      _saveToken(acessToken);
    } on AuthRepositoryNetworkError {
      throw AuthServiceNetworkError();
    } on AuthRepositoryClientError {
      throw AuthServiceClientError();
    } on AuthRepositoryServerError {
      throw AuthServiceServerError();
    } on AuthRepositoryGenericError {
      throw AuthServiceGenericError;
    }
  }

  Future<void> _saveToken(String token) async {
    await localStorageRepository.setJwtToken(token);
  }
}

abstract class AuthServiceError extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

class AuthServiceNetworkError extends AuthServiceError {}

class AuthServiceClientError extends AuthServiceError {}

class AuthServiceServerError extends AuthServiceError {}

class AuthServiceGenericError extends AuthServiceError {}
