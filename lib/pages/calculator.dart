import 'package:flutter/material.dart';

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  Widget btn(String text, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {},
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
                    "0",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black, fontSize: 100),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("AC", Colors.grey, Colors.black),
                btn("+/-", Colors.grey, Colors.black),
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

  String output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      setState(() {
        output = "0";
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      });
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "X" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      output = "0";
    } else if (buttonText == ".") {
      if (!output.contains(".")) {
        output += ".";
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        output = (num1 + num2).toString();
      }
      if (operand == "-") {
        output = (num1 - num2).toString();
      }
      if (operand == "X") {
        output = (num1 * num2).toString();
      }
      if (operand == "/") {
        if (num2 != 0) {
          output = (num1 / num2).toString();
        } else {
          output = "Error";
        }
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      setState(() {
        if (output == "0") {
          output = buttonText;
        } else {
          output += buttonText;
        }
      });
    }
  }
}
