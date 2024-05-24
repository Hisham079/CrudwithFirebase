import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static late SharedPreferences _prefs;
  
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setUserId(String userId) async {
    await _prefs.setString('userId', userId);
  }

  static String? getUserId() {
    return _prefs.getString('userId');
  } 
}
