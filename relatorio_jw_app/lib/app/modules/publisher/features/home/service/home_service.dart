import 'package:equatable/equatable.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/repository/models/user_publisher.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/home/repository/home_repository.dart';

class HomeService {
  HomeRepository homeRepository;
  HomeService({
    required this.homeRepository,
  });

  Future<UserPublisher> getPublisher() async {
    try {
      final publisher = await homeRepository.getPublisher();
      return publisher;
    } on HomeRepositoryNetworkError {
      throw HomeServiceNetworkError();
    } on HomeRepositoryClientError {
      throw HomeServiceClientError();
    } on HomeRepositoryServerError {
      throw HomeServiceServerError();
    } on HomeRepositoryGenericError {
      throw HomeServiceGenericError;
    }
  }

  Future<void> signOut() async {
    try {
      await homeRepository.signOut();
    } on HomeRepositoryNetworkError {
      throw HomeServiceNetworkError();
    } on HomeRepositoryClientError {
      throw HomeServiceClientError();
    } on HomeRepositoryServerError {
      throw HomeServiceServerError();
    } on HomeRepositoryGenericError {
      throw HomeServiceGenericError;
    }
  }
}

abstract class HomeServiceError extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

class HomeServiceNetworkError extends HomeServiceError {}

class HomeServiceClientError extends HomeServiceError {}

class HomeServiceServerError extends HomeServiceError {}

class HomeServiceGenericError extends HomeServiceError {}
