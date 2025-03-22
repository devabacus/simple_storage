import 'package:example/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_storage/simple_storage_interface.dart';

class MockStorage extends Mock implements SimpleStorageInterface {}

void main() {
  late MockStorage mockStorage;
  late UserStorageService service;


  setUp(() {
    mockStorage = MockStorage();
    // вот здесь обманули сервис и подсунули мок
    service = UserStorageService(storageRepo: mockStorage);
  });

  test('тестируем сохранения имени', () async {
    when(mockStorage.saveString(key: 'userName', val: 'asdf')).thenAnswer((_) async => true);

    when(mockStorage.getString(key: 'userName')).thenAnswer((_) async => 'Ivan');
    
    final result = await service.saveName('asdf');
    expect(result, true);
    

  });



}
