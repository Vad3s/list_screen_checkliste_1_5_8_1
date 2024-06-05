import 'package:flutter/material.dart';
import 'package:list_screen_checkliste_1_5_8_1/src/features/list_screen/presentation/list_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListScreen(),
    );
  }
}
