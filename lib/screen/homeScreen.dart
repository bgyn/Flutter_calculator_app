import 'package:flutter/material.dart';
import 'package:flutter_parse/flutter_parse.dart';
import 'package:math_expressions/math_expressions.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var firtNum = 0.0;
  var secondNum = 0.0;
  var input = '';
  var output = '';
  var operator = '';

  onButtonclick(key) {
    if (key == 'AC') {
      input = '';
      output = '';
    } else if (key == '←') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (key == '=') {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll('x', '*');
        Parser P = Parser();
        Expression exp = P.parse(userInput);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        output = eval.toString();
      }
    } else {
      input = input + key;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              // color: Colors.red,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    input,
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    output,
                    style: TextStyle(
                        fontSize: 25, color: Colors.white.withOpacity(0.5)),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              button(text: "AC", btnBgColor: Colors.grey),
              button(text: "/", btnBgColor: Colors.grey),
              button(text: "+/-", btnBgColor: Colors.grey),
              button(text: "←", btnBgColor: Colors.amber),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(text: "x", btnBgColor: Colors.amber),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "-", btnBgColor: Colors.amber),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "+", btnBgColor: Colors.amber),
            ],
          ),
          Row(
            children: [
              button(text: "%"),
              button(text: "0"),
              button(text: "."),
              button(text: "=", btnBgColor: Colors.amber),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({text, tColor = Colors.white, btnBgColor = Colors.black}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(22),
              backgroundColor: btnBgColor),
          onPressed: () {
            onButtonclick(text);
            setState(() {});
          },
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20, color: tColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
