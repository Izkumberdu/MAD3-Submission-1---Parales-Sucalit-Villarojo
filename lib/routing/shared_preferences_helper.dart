import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences _prefs;

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String getToken() {
    return _prefs.getString('token') ?? '';
  }

  static Future<void> setToken(String token) async {
    await _prefs.setString('token', token);
  }

  static Future<void> clearToken() async {
    await _prefs.remove('token');
  }
}
