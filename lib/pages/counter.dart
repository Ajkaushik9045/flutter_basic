import 'package:flutter/material.dart';

class counter extends StatefulWidget {
  const counter({super.key});

  @override
  State<counter> createState() => _counterState();
}

class _counterState extends State<counter> {
  int counter = 0;
  void incremnet() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App"),
      backgroundColor: Colors.purple[100],),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Press this Button to Increment"),
          Text(counter.toString()),
          ElevatedButton(onPressed: incremnet, child: Text("Incremnet"))
        ],
      )),
    );
  }
}
