import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_storage/simple_storage_interface.dart';

class SharedPrefRepo implements SimpleStorageInterface {
  final SharedPreferences pref;

  SharedPrefRepo({required this.pref});

  @override
  Future<bool> saveBool({required String key, required bool val}) async {
    return await pref.setBool(key, val);
  }

  @override
  Future<bool> saveInt({required String key, required int val}) async {
    return pref.setInt(key, val);
  }

  @override
  Future<bool> saveString({required String key, required String val}) async {
    return pref.setString(key, val);
  }

  @override
  Future<bool> getBool({required String key, defaultValue = false}) async {
    return pref.getBool(key) ?? defaultValue;
  }

  @override
  Future<int> getInt({required String key, defaultValue = 0}) async {
    return pref.getInt(key) ?? defaultValue;
  }

  @override
  Future<String> getString({required String key, defaultValue = ''}) async {
    return pref.getString(key) ?? defaultValue;
  }

  Future<bool> removeKey({required String key}) async {
    return pref.remove(key);
  }

  Future<bool> clearAll() async {
    return pref.clear();
  }
}
