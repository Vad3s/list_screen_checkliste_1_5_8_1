import 'package:flutter/material.dart';
import 'package:list_screen_checkliste_1_5_8_1/src/data/shared_preferences_repository.dart';
import 'package:list_screen_checkliste_1_5_8_1/src/features/app.dart';

void main() {
  runApp(App(databaseRepository: SharedPreferencesRepository()));
}
