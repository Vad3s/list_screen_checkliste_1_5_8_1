import 'package:flutter/material.dart';
import 'package:list_screen_checkliste_1_5_8_1/src/data/database_repository.dart';
import 'package:list_screen_checkliste_1_5_8_1/src/data/mockdatabase_repository.dart';
import 'package:list_screen_checkliste_1_5_8_1/src/features/app.dart';

DatabaseRepository databaseRepository = MockDatabaseRepository();

void main() {
  runApp(App(databaseRepository: MockDatabaseRepository()));
}
