import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  setData({required String name, dynamic data}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(name, data);
  }

  getData({required String name}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(name);
    return data;
  }
  
   setBoolData({required String name, required bool data}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(name, data);
  }

  getBoolData({required String name}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? data = prefs.getBool(name);
    return data;
  }

  removeData({required String name}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(name);
  }

  clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
