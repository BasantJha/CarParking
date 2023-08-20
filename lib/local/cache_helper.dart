

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {


  static Future<dynamic> putBoolean({
    required String ? key,
    required dynamic value,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences!.setBool(key!, value!);
  }

  static dynamic getData({
    required String? key,
  }) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences!.get(key!);
  }

  static Future<dynamic> saveData({
    required String ?key,
    required dynamic ?value
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (value is String) return await sharedPreferences.setString(key!, value);
    if (value is int) return await sharedPreferences.setInt(key!, value);
    if (value is bool) return await sharedPreferences.setBool(key!, value);
    return await sharedPreferences.setDouble(key!, value);

  }

  static Future<dynamic> saveListData({
    required String ?key,
    required List<String> ?value
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setStringList(key!, value ?? []);

  }

  static Future<bool> removeData({
    required String ?key,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.remove(key!);
  }
  static Future<dynamic> removeAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.clear();
  }

  static dynamic getListData({
    required String? key,
  }) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(key!)?.map((e) => e).toSet().toList();
  }
}