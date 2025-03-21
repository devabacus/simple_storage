import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_storage/simple_storage_interface.dart';

class SharedPrefRepo implements SimpleStorageInterface {
  SharedPreferences? _pref;

  Future<SharedPreferences> _getPref() async {
    _pref ??= await SharedPreferences.getInstance();
    return _pref!;
  }

  @override
  Future<bool> saveBool({required String key, required bool val}) async {
    final pref = await _getPref();
    return pref.setBool(key, val);
  }

  @override
  Future<bool> saveInt({required String key, required int val}) async {
    final pref = await _getPref();
    return pref.setInt(key, val);
  }

  @override
  Future<bool> saveString({required String key, required String val}) async {
    final pref = await _getPref();
    return pref.setString(key, val);
  }

  @override
  Future<bool> getBool({required String key, defaultValue = false}) async {
    final pref = await _getPref();
    return pref.getBool(key) ?? defaultValue;
  }

  @override
  Future<int> getInt({required String key, defaultValue = 0}) async {
    final pref = await _getPref();
    return pref.getInt(key) ?? defaultValue;
  }

  @override
  Future<String> getString({required String key, defaultValue = ''}) async {
    final pref = await _getPref();
    return pref.getString(key) ?? defaultValue;
  }



  Future<bool> removeKey({required String key}) async {
    final pref = await _getPref();
    return pref.remove(key);
  }

  Future<bool> clearAll() async {
    final pref = await _getPref();
    return pref.clear();
  }
}
