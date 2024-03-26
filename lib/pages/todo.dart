// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/component/alertdialog.dart';
import 'package:my_app/component/toDo_tiles.dart';
import 'package:my_app/data/database.dart';

class toDo extends StatefulWidget {
  const toDo({super.key});

  @override
  State<toDo> createState() => _toDoState();
}

class _toDoState extends State<toDo> {
  final _myBox = Hive.box('mybox');
  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.intitalData();
    } else {
      db.loadData();
    }
    super.initState();
    // initState();
  }

  toDoDataBase db = toDoDataBase();

  final control = TextEditingController();

  void checkboxClicked(bool? value, int index) {
    setState(() {
      db.toDolist[index][1] = !db.toDolist[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.toDolist.add([control.text, false]);
      control.clear();
      Navigator.of(context).pop();
    });
    db.updateData();
  }

  void createTask() {
    showDialog(
      context: context,
      builder: (context) {
        return alert(
          controller: control,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deteleTask(int index) {
    setState(() {
      db.toDolist.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
        backgroundColor: Colors.purple[100],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDolist.length,
        itemBuilder: (context, index) {
          return toDoTiles(
            taskName: db.toDolist[index][0],
            taskCompleted: db.toDolist[index][1],
            onChanged: (value) => checkboxClicked(value, index),
            deleteFunction: (context) => deteleTask(index),
          );
        },
      ),
    );
  }
}
