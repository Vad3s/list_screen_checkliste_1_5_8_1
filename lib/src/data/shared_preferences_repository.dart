import 'package:shared_preferences/shared_preferences.dart';
import 'database_repository.dart';

class SharedPreferencesRepository implements DatabaseRepository {
  static const String _key = 'items';

  @override
  Future<List<String>> getItems() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  @override
  Future<void> addItem(String item) async {
    final prefs = await SharedPreferences.getInstance();
    final items = prefs.getStringList(_key) ?? [];
    items.add(item);
    await prefs.setStringList(_key, items);
  }

  @override
  Future<void> removeItem(String item) async {
    final prefs = await SharedPreferences.getInstance();
    final items = prefs.getStringList(_key) ?? [];
    items.remove(item);
    await prefs.setStringList(_key, items);
  }
}
