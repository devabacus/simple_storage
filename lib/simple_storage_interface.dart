abstract class SimpleStorageInterface {
  Future<bool> saveString({required String key, required String val});
  Future<bool> saveBool({required String key, required bool val});
  Future<bool> saveInt({required String key, required int val});
  Future<String> getString({required String key,defaultValue = ''});
  Future<int> getInt({required String key, defaultValue = 0});
  Future<bool> getBool({required String key, defaultValue = false});
}
