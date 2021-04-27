import 'package:flutter/material.dart';
import 'package:todo_list_flutter/screens/start_screen.dart';

import 'screens/notes_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartScreen(),
    );
  }
}