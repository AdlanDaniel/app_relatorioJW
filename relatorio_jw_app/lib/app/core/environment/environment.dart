import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Environment {
  String get baseUrl;

  String get connectTimeout;

  String get receiveTimeout;

  String get(
    String key, {
    String? defaultValue,
  });
}

class DefaultEnvironment implements Environment {
  final DotEnv _env;

  DefaultEnvironment(this._env);

  @override
  String get baseUrl => get('BASE_URL');

  Future<void> init({
    required String fileName,
  }) async {
    await _env.load(fileName: fileName);
  }

  @override
  String get(String key, {String? defaultValue}) {
    final value = _env.env[key];
    return value ?? defaultValue ?? '';
  }

  @override
  String get connectTimeout => get('CONNECT_TIMEOUT');

  @override
  String get receiveTimeout => get('RECEIVE_TIMEOUT');
}
