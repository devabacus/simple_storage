import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_storage/simple_storage.dart';
import 'package:simple_storage/simple_storage_interface.dart';

void main(List<String> args) async {
  final userStorage = await getStorageService();
  userStorage.getName().then(print);
  userStorage.getAge().then(print);
  userStorage.saveName("Ivan");
  userStorage.saveAge(25);
}

Future<UserStorageService> getStorageService() async {
  final sPref = await SharedPreferences.getInstance();
  final sPrefRepo = SharedPrefRepo(pref: sPref);
  return UserStorageService(storageRepo: sPrefRepo);
}

class UserStorageService {
  final SimpleStorageInterface storageRepo;

  UserStorageService({required this.storageRepo});

  void saveName(String name) {
    storageRepo.saveString(key: 'userName', val: name);
  }

  void saveAge(int age) {
    storageRepo.saveInt(key: 'userAge', val: age);
  }

  Future<String> getName() async {
    return storageRepo.getString(key: 'userName');
  }

  Future<int> getAge() async {
    return storageRepo.getInt(key: 'userAge');
  }
}
