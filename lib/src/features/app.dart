import 'package:flutter/material.dart';
import 'package:list_screen_checkliste_1_5_8_1/src/data/database_repository.dart';
import 'package:list_screen_checkliste_1_5_8_1/src/features/list_screen/presentation/list_screen.dart';

class App extends StatelessWidget {
  final DatabaseRepository databaseRepository;

  const App({super.key, required this.databaseRepository});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListScreen(),
    );
  }
}
