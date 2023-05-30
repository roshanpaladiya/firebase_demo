import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefServices {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setValue(String key, dynamic value) async {
    if (value is String) {
      await _prefs?.setString(key, value);
    } else if (value is double) {
      await _prefs?.setDouble(key, value);
    } else if (value is bool) {
      await _prefs?.setBool(key, value);
    } else if (value is int) {
      await _prefs?.setInt(key, value);
    } else if (value is List<String>) {
      await _prefs?.setStringList(key, value);
    } else {
      Get.snackbar("Preffence error",
          "send valid value for store data shared preffernce");
    }
  }

  static String getString(String key) {
    return _prefs?.getString(key) ?? '';
  }

  static double getDouble(String key) {
    return _prefs?.getDouble(key) ?? 0.0;
  }

  static bool getBool(String key) {
    return _prefs?.getBool(key) ?? false;
  }

  static int getInt(String key) {
    return _prefs?.getInt(key) ?? 0;
  }

  static List? getStringList(String key) {
    return _prefs?.getStringList(key) ?? [];
  }
}
