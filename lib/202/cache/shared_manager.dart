import 'package:flutter_learn/202/cache/shared_not_initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter, users }

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPreferences() {
    if (preferences == null) throw SharedNotInitializeExeption();
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPreferences();
    await preferences?.setString(key.name, value);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> values) async {
    _checkPreferences();
    await preferences?.setStringList(key.name, values);
  }

  String? getString(SharedKeys key) {
    _checkPreferences();
    return preferences?.getString(key.name);
  }

  List<String>? getStringItems(SharedKeys key) {
    _checkPreferences();
    return preferences?.getStringList(key.name);
  }

  Future<bool> remove(SharedKeys key) async {
    _checkPreferences();
    return (await preferences?.remove(key.name) ?? false);
  }
}


//preference initilize işlemini contructorda değil de kullanılacak olan sınıfın init statetinde yapıyoruz

//bunun nedeni ise intialize olmadan fonksiyon çalıştırma ihtimalini düşürmek