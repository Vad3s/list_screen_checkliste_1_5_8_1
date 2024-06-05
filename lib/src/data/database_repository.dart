abstract class DatabaseRepository {
  Future<List<String>> getItems();
  Future<void> addItem(String item);
  Future<void> removeItem(String item);
}
