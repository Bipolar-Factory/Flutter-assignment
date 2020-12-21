import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:mimichat/datamodels/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

@preResolve
@lazySingleton
class LocalDataService{
  static LocalDataService _instance;
  static SharedPreferences _preferences;

  static const String UserKey = "user";
  static const String ThemeKey = "theme";

  @factoryMethod
  static Future<LocalDataService> getInstance() async {
    if (_instance == null) {
      _instance = LocalDataService();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  UserModel get user {
    var userJson = _getFromDisk(UserKey);
    if (userJson == null) return null;
    return UserModel.fromJson(jsonDecode(userJson));
  }

  set user(UserModel userToSave) {
    _saveToDisk<String>(UserKey, jsonEncode(userToSave.toJson()));
  }

  dynamic _getFromDisk(String key) {
    var value = _preferences.get(key);
    print('(TRACE) SharedPrefService: _getFromDisk. key: $key value: $value');
    return value;
  }

  void _saveToDisk<T>(String key, T value) {
    print('(TRACE) SharedPrefService:_saveStringToDisk. key: $key value: $value');
    if (value is String)
      _preferences.setString(key, value);
    else if (value is int) _preferences.setInt(key, value);
  }
}