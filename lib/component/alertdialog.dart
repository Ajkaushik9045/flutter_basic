import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/component/buttons.dart';

class alert extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  alert(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[100],
      content: Container(
        height: 120,
        child: Column(children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Enter the task"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              mybutton(text: "Save", onpressed: onSave),
              const SizedBox(
                width: 10,
              ),
              mybutton(text: "Cancel", onpressed: onCancel),
            ],
          ),
        ]),
      ),
    );
  }
}
