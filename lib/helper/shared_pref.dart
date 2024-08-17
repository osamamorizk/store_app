import 'package:shared_preferences/shared_preferences.dart';

class CahedStorge {
  static late final SharedPreferences sharedPref;

  static Future cacheIntialization() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> insertToCache({
    required String key,
    required String value,
  }) async {
    return await sharedPref.setString(key, value);
  }

  static String getFromCache({
    required String key,
  }) {
    return sharedPref.getString(key) ?? '';
  }

  static Future<bool> deletFromCache({
    required String key,
  }) async {
    return await sharedPref.remove(key);
  }
}
