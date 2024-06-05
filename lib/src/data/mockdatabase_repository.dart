import 'database_repository.dart';

class MockDatabaseRepository implements DatabaseRepository {
  final List<String> _items = [];

  @override
  Future<List<String>> getItems() async {
    return _items;
  }

  @override
  Future<void> addItem(String item) async {
    _items.add(item);
  }

  @override
  Future<void> removeItem(String item) async {
    _items.remove(item);
  }
}
