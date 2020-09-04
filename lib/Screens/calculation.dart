import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/cupertino.dart';

//Uses Calculator for typing the amount to be use for mone transfer
class MoneyCalculation extends StatefulWidget {
  @override
  MoneyCalculation({
    Key key,
  }) : super(key: key);
  _MoneyCalculationState createState() => _MoneyCalculationState();
}

class _MoneyCalculationState extends State<MoneyCalculation> {
  //variables used
  String output = "0";
  String result = "0";
  String expression = "";

  //function performed on calculation button
  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        output = "0";
        result = "0";
      } else if (buttonText == "⌫") {
        output = output.substring(0, output.length - 1);
        if (output == "") {
          output = "0";
        }
      } else if (buttonText == "=") {
        expression = output;
        expression = expression.replaceAll('X', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(
              expression); //parse is used to convert string to mathematical form

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (output == "0") {
          output = buttonText;
        } else {
          output = output + buttonText;
        }
      }
    });
  }

  //widget is used to describe working of keys
  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

//keybord + output + result
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Text(
            output,
            style: TextStyle(fontSize: 28.0),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Text(
            result,
            style: TextStyle(fontSize: 28.0),
          ),
        ),
        Expanded(child: Divider()),
        Column(children: <Widget>[
          Row(
            children: <Widget>[
              buildButton("C"),
              buildButton("⌫"),
              buildButton("/"),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("X"),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("-"),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("+"),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("."),
              buildButton("0"),
              buildButton("%"),
              buildButton("="),
            ],
          ),
        ])
      ],
    )));
  }
}
