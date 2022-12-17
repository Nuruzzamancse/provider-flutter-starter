import 'dart:convert';

import 'package:biofresh/common/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginData {
  void storeToken(token) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(TOKEN, token);
  }

  Future<String?> getStoredToken() async {
    final SharedPreferences localData = await SharedPreferences.getInstance();
    final token = localData.getString(TOKEN);
    return token;
  }
}
