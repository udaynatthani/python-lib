import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  String input = "";
  String output = "0";

  void buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        output = "0";
      } 
      else if (value == "=") {
        try {
          output = _calculate(input);
        } catch (e) {
          output = "Error";
        }
      } 
      else {
        input += value;
      }
    });
  }

  String _calculate(String exp) {
    // Simple calculation (basic operations only)
    try {
      final result = _evaluate(exp);
      return result.toString();
    } catch (e) {
      return "Error";
    }
  }

  double _evaluate(String exp) {
    // VERY BASIC parser (only +, -, *, /)
    List<String> tokens = exp.split(RegExp(r'([+\-*/])'));
    List<String> operators = exp.replaceAll(RegExp(r'[0-9.]'), '').split('');

    double result = double.parse(tokens[0]);

    for (int i = 0; i < operators.length; i++) {
      double next = double.parse(tokens[i + 1]);

      switch (operators[i]) {
        case '+':
          result += next;
          break;
        case '-':
          result -= next;
          break;
        case '*':
          result *= next;
          break;
        case '/':
          result /= next;
          break;
      }
    }
    return result;
  }

  Widget buildButton(String text, {Color color = Colors.blue}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
            backgroundColor: color,
          ),
          onPressed: () => buttonPressed(text),
          child: Text(text, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
      ),

      body: Column(
        children: [

          // Display
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(input, style: TextStyle(fontSize: 24)),
                SizedBox(height: 10),
                Text(output, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          Divider(),

          // Buttons
          Expanded(
            child: Column(
              children: [
                Row(children: [buildButton("7"), buildButton("8"), buildButton("9"), buildButton("/", color: Colors.orange)]),
                Row(children: [buildButton("4"), buildButton("5"), buildButton("6"), buildButton("*", color: Colors.orange)]),
                Row(children: [buildButton("1"), buildButton("2"), buildButton("3"), buildButton("-", color: Colors.orange)]),
                Row(children: [buildButton("0"), buildButton("C", color: Colors.red), buildButton("=" , color: Colors.green), buildButton("+", color: Colors.orange)]),
              ],
            ),
          )
        ],
      ),
    );
  }
}