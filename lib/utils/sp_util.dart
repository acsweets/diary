import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static SharedPreferences? _prefs;

  static SpUtil? _instance;

  static Future<SpUtil?> getInstance() async {
    _instance ??= await SpUtil._()._init();

    return _instance;
  }

  SpUtil._();

  Future _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String getString(String key, {String defValue = ''}) {
    if (_prefs == null) return defValue;
    return _prefs!.getString(key) ?? defValue;
  }

  static Future<bool> setString(String key, String value) {
    if (_prefs == null) return Future.value(false);
    return _prefs!.setString(key, value);
  }

  static List<String> getStringList(String key) {
    if (_prefs == null) return [];
    return _prefs!.getStringList(key) ?? [];
  }

  static Future<bool> setStringList(String key, List<String> value) {
    if (_prefs == null) return Future.value(false);
    return _prefs!.setStringList(key, value);
  }

  static bool getBool(String key, {bool defValue = false}) {
    if (_prefs == null) return defValue;
    return _prefs!.getBool(key) ?? defValue;
  }

  static Future<bool> setBool(String key, bool value) {
    if (_prefs == null) return Future.value(false);
    return _prefs!.setBool(key, value);
  }

  static int getInt(String key, {int defValue = 0}) {
    if (_prefs == null) return defValue;
    return _prefs!.getInt(key) ?? defValue;
  }

  static Future<bool> setInt(String key, int value) {
    if (_prefs == null) return Future.value(false);
    return _prefs!.setInt(key, value);
  }

  static double getDouble(String key, {double defValue = 0.0}) {
    if (_prefs == null) return defValue;
    return _prefs!.getDouble(key) ?? defValue;
  }

  static Future<bool> setDouble(String key, double value) {
    if (_prefs == null) return Future.value(false);
    return _prefs!.setDouble(key, value);
  }

  static Future<bool> remove(String key) {
    if (_prefs == null) return Future.value(false);
    return _prefs!.remove(key);
  }

  static Future<bool> clear() {
    if (_prefs == null) return Future.value(false);
    return _prefs!.clear();
  }

  /// get 方法
  T? get<T>(String key) {
    var result = _prefs!.get(key);
    if (result != null) {
      return result as T;
    }
    return null;
  }
}
