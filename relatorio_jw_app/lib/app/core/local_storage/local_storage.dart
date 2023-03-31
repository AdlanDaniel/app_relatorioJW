import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesStorage {
  Future<void> init();

  Future<bool> containsKey(String key);

  Future<bool> remove(String key);

  Future<bool> setString(String key, String value);

  Future<bool> setBool(String key, bool value);

  Future<bool> setDouble(String key, double value);

  Future<bool> setInt(String key, int value);

  Future<bool> setStringList(String key, List<String> value);

  Future<String?> getString(String key);

  Future<bool?> getBool(String key);

  Future<double?> getDouble(String key);

  Future<int?> getInt(String key);

  Future<List<String>?> getStringList(String key);

  Future<bool> clear();
}

class SharedPreferencesStorage extends PreferencesStorage {
  final SharedPreferences _preferences;

  SharedPreferencesStorage(this._preferences);

  @override
  Future<void> init() async {}

  @override
  Future<bool> containsKey(String key) async => _preferences.containsKey(key);

  @override
  Future<bool> remove(String key) => _preferences.remove(key);

  @override
  Future<bool> clear() => _preferences.clear();

  @override
  Future<bool?> getBool(String key) async => _preferences.getBool(key);

  @override
  Future<double?> getDouble(String key) async => _preferences.getDouble(key);

  @override
  Future<int?> getInt(String key) async => _preferences.getInt(key);

  @override
  Future<String?> getString(String key) async => _preferences.getString(key);

  @override
  Future<List<String>?> getStringList(String key) async =>
      _preferences.getStringList(key);

  @override
  Future<bool> setBool(String key, bool value) =>
      _preferences.setBool(key, value);

  @override
  Future<bool> setDouble(String key, double value) =>
      _preferences.setDouble(key, value);

  @override
  Future<bool> setInt(String key, int value) => _preferences.setInt(key, value);

  @override
  Future<bool> setString(String key, String value) =>
      _preferences.setString(key, value);

  @override
  Future<bool> setStringList(String key, List<String> value) =>
      _preferences.setStringList(key, value);
}
