import 'package:flutter/material.dart';
import 'package:list_screen_checkliste_1_5_8_1/src/data/database_repository.dart';

class ListScreen extends StatefulWidget {
  final DatabaseRepository databaseRepository;

  const ListScreen({super.key, required this.databaseRepository});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController _controller = TextEditingController();
  late DatabaseRepository _repository;
  List<String> _items = [];

  @override
  void initState() {
    super.initState();
    _repository = widget.databaseRepository;
    _loadItems();
  }

  Future<void> _loadItems() async {
    final items = await _repository.getItems();
    setState(() {
      _items = items;
    });
  }

  void _addItem() async {
    if (_controller.text.isNotEmpty) {
      await _repository.addItem(_controller.text);
      _controller.clear();
      _loadItems();
    }
  }

  void _removeItem(String item) async {
    await _repository.removeItem(item);
    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkliste 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter a text',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addItem,
              child: const Text('Add Item'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return ListTile(
                    title: Text(item),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
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
