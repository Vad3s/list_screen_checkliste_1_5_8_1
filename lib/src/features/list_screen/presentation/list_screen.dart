import 'package:flutter/material.dart';
import 'package:list_screen_checkliste_1_5_8_1/src/data/database_repository.dart';
import 'package:list_screen_checkliste_1_5_8_1/src/data/mockdatabase_repository.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController _controller = TextEditingController();
  final DatabaseRepository mockDB = MockDatabaseRepository();

  List<String> _items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    final items = await mockDB.getItems();
    setState(() {
      _items = items;
    });
  }

  void _addItem() async {
    if (_controller.text.isNotEmpty) {
      await mockDB.addItem(_controller.text);
      _controller.clear();
      _loadItems();
    }
  }

  void _removeItem(String item) async {
    await mockDB.removeItem(item);
    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkliste 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter a text',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Add Item'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return ListTile(
                    title: Text(item),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeItem(item),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
