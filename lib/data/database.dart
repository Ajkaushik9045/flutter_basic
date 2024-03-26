import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class toDoDataBase {
  final _mybox = Hive.box('mybox');
  List toDolist = [
    ["Create Task", false],
    ["create task 2", true],
  ];

  void intitalData() {
    toDolist = [
      ["Create Task", false],
    ];
  }

  void loadData() {
    toDolist = _mybox.get("TODOLIST");
  }

  void updateData() {
    _mybox.put("TODOLIST", toDolist);
  }
}
