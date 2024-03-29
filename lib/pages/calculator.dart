import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  // TextEditingController myController = TextEditingController();
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
                btn("AC", Colors.purple.shade100, Colors.black),
                btn("D", Colors.purple.shade100, Colors.black),
                btn("%", Colors.orange, Colors.black),
                btn("/", Colors.orange, Colors.black),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("7", Colors.grey, Colors.black),
                btn("8", Colors.grey, Colors.black),
                btn("9", Colors.grey, Colors.black),
                btn("x", Colors.orange, Colors.black),
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
    } else if (buttonText == "D") {
      deleteNumber();
      return;
    } else if (buttonText == "%") {
      convertToPercentage();
      return;
    } else if (buttonText == "=") {
      calculate();
      // convertToPercentage();
      return;
    }
    append(buttonText);
  }

  void cal() {}

  void calculate() {
    if (num1.isEmpty || num2.isEmpty || operand.isEmpty) {
      return; // Calculate only if all values are present
    }
    double number1 = double.tryParse(num1) ??
        0.0; // Parse num1, default to 0.0 if parsing fails
    double number2 = double.tryParse(num2) ??
        0.0; // Parse num2, default to 0.0 if parsing fails
    var result = 0.0;
    switch (operand) {
      case "+":
        result = number1 + number2;
        break;

      case "-":
        result = number1 - number2;
        break;

      case "x":
        result = number1 * number2;
        break;

      case "/":
        if (number2 != 0) {
          result = number1 / number2;
        } else {
          // Handle division by zero
          // For now, we can set the result to 0.0, but you might want to show an error message
          result = 0.0;
        }
        break;
      default:
      // Handle unknown operand (optional)
    }

    setState(() {
      num1 = result.toString(); // Update num1 with the result
      if (num1.endsWith(".0")) {
        num1 = num1.substring(0, num1.length - 2);
      }
      operand = ""; // Reset the operand
      num2 = ""; // Reset num2
    });
  }

  void convertToPercentage() {
    if (num1.isNotEmpty && num2.isNotEmpty && operand.isNotEmpty) {
      calculate();
    }
    if (operand.isNotEmpty) {
      return;
    }
    final number = double.parse(num1);

    setState(() {
      num1 = "${(number / 100)}";
      operand = "";
      num2 = "";
    });
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
    if (buttonText == "." && (operand.isEmpty || num2.isEmpty)) {
      // If the current button is a decimal point and there's no operand or num2
      // Then it's part of num2
      if (!num2.contains(".")) {
        // Ensure there's only one decimal point
        num2 += buttonText;
      }
    } else if (_isNumeric(buttonText)) {
      // If the current button is a number
      if (operand.isEmpty) {
        // If there's no operand, append to num1
        num1 += buttonText;
      } else {
        // If there's an operand, append to num2
        num2 += buttonText;
      }
    } else if (_isOperand(buttonText)) {
      // If the current button is an operand
      if (num1.isNotEmpty && num2.isNotEmpty) {
        // If both num1 and num2 are not empty, calculate the result
        calculate();
        num1 = num1; // Set the result as num1
        num2 = ""; // Clear num2 for new input
      }
      operand = buttonText; // Set the operand
    }
    setState(() {}); // Update the UI
  }

  bool _isNumeric(String str) {
    // Helper function to check if a string is numeric
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  bool _isOperand(String str) {
    // Helper function to check if a string is an operand
    return str == "+" || str == "-" || str == "x" || str == "/";
  }
}
