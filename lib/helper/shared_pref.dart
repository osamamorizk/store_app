import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<void> storeToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }
}
