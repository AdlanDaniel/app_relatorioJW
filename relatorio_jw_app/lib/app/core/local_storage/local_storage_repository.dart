import 'dart:convert';
import 'package:relatorio_jw_app/app/core/local_storage/local_storage.dart';
import 'package:relatorio_jw_app/app/modules/publisher/features/auth/repository/models/user_publisher.dart';

abstract class LocalStorageRepository {
  Future<UserPublisher?> getUserPublisher();

  Future<bool> setUserPublisher(UserPublisher userPublisher);

  Future<bool> clearUserPublisher();

  Future<bool> clearJwtToken();

  Future<String?> getJwtToken();

  Future<void> setJwtToken(String tokenJWT);
}

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  static const tokenJWTKey = '547b2e2a-4fef-4b57-bd98-26eff931aa9e';

  static const userPublisherKey = '7065ce3c-ed08-4627-98b7-eaf3fa1fc29e';

  final PreferencesStorage _preferencesStorage;

  LocalStorageRepositoryImpl(this._preferencesStorage);

  @override
  Future<UserPublisher?> getUserPublisher() async {
    final userString = await _preferencesStorage.getString(userPublisherKey);
    if (userString != null) {
      return UserPublisher.fromMap(
          jsonDecode(userString) as Map<String, dynamic>);
    }

    return null;
  }

  @override
  Future<bool> setUserPublisher(UserPublisher userPublisher) async =>
      _preferencesStorage.setString(
          userPublisherKey, jsonEncode(userPublisher.toMap()));

  @override
  Future<String?> getJwtToken() async =>
      await _preferencesStorage.getString(tokenJWTKey);

  @override
  Future<bool> clearJwtToken() => _preferencesStorage.remove(tokenJWTKey);

  @override
  Future<bool> clearUserPublisher() =>
      _preferencesStorage.remove(userPublisherKey);

  @override
  Future<void> setJwtToken(String token) async =>
      await _preferencesStorage.setString(tokenJWTKey, token);
}
