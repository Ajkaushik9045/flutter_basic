import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  TextEditingController myController = TextEditingController();
  Widget btn(String text, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          buttonPressed(text);
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 35, color: txtcolor),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: btncolor,
          shape: CircleBorder(),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.purple[100],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 23,
                  ),
                  child: Text(
                    "$num1$operand$num2".isEmpty ? "0" : "$num1$operand$num2",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("AC", Colors.grey, Colors.black),
                btn("D", Colors.grey, Colors.black),
                btn("%", Colors.grey, Colors.black),
                btn("/", Colors.orange, Colors.black),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("7", Colors.grey, Colors.black),
                btn("8", Colors.grey, Colors.black),
                btn("9", Colors.grey, Colors.black),
                btn("X", Colors.orange, Colors.black),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("4", Colors.grey, Colors.black),
                btn("5", Colors.grey, Colors.black),
                btn("6", Colors.grey, Colors.black),
                btn("-", Colors.orange, Colors.black),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("1", Colors.grey, Colors.black),
                btn("2", Colors.grey, Colors.black),
                btn("3", Colors.grey, Colors.black),
                btn("+", Colors.orange, Colors.black),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "0",
                    style: TextStyle(fontSize: 35, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 5)),
                ),
                btn(".", Colors.grey, Colors.black),
                btn("=", Colors.orange, Colors.black),
              ],
            )
          ],
        ),
      ),
    );
  }

  // dynamic output = "";
  String num1 = "";
  String num2 = "";
  String operand = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      clearAll();
      return;
    }
    if (buttonText == "D") {
      deleteNumber();
      return;
    }
    append(buttonText);
  }

  void deleteNumber() {
    setState(() {
      if (num2.isNotEmpty) {
        num2 = num2.substring(0, num2.length - 1);
      } else if (operand.isNotEmpty) {
        operand = "";
      } else if (num1.isNotEmpty) {
        num1 = num1.substring(0, num1.length - 1);
      }
    });
  }

  void clearAll() {
    setState(() {
      num1 = "";
      num2 = "";
      operand = "";
    });
  }

  void append(String buttonText) {
    if (buttonText == "." && int.tryParse(buttonText) == null) {
      if (operand.isNotEmpty && num2.isNotEmpty) {}
      operand = buttonText;
    } else if (num1.isEmpty || operand.isEmpty) {
      if (buttonText == "." && num1.contains(".")) return;
      if (buttonText == "." && (num1.isNotEmpty || num1 == "0")) {
        buttonText = "0.";
      }
      num1 += buttonText;
    } else if (num2.isEmpty || operand.isNotEmpty) {
      // if (buttonText == "." && num2.contains(".")) return;
      if (buttonText == "." && (num2.isEmpty || num2 == "0")) {
        buttonText = "0.";
      }
      num2 += buttonText;
    }
    setState(() {});
  }
}
