// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:my_app/pages/calculator.dart';
import 'package:my_app/pages/counter.dart';
import 'package:my_app/pages/frist_page.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/settings.dart';
import 'package:my_app/pages/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Fristpage(),
      routes: {
        '/HomePage': (context) => HomePage(),
        '/SettingPage': (context) => SettingsPage(),
        '/counter': (context) => counter(),
        '/calculator': (context) =>calculator(),
        '/toDo': (context) => toDo(),
      },
    );
  }
}
