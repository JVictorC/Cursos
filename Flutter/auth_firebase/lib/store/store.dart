import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Store {
  static Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
  
  static Future<void> setMap(String key, Map<String, dynamic> value) async {
    setString(key, jsonEncode(value));
  }

  static Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  static Future<Map<String, dynamic>> getMap(String key) async {
    try {
      final result = await getString(key);
      return jsonDecode(result);
    } catch (e) {
      return {};
    }
  }

  static Future<void> removeMap(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

}
