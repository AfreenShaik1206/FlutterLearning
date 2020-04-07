import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './countriesList.dart';

void main() => runApp(calculator());

class calculator extends StatelessWidget {
   // This widget is the root of your application.
   Widget build(BuildContext context) {
    
     return MaterialApp(
       title: 'Calculator',
       theme: new ThemeData(
          primarySwatch: Colors.blue,
          
       ),
       home: new CalculatorPage(title: "Calculator"),
     );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
   CalculatorPage({Key key, this.title}): super(key: key);
   final title;
  _CalculatorPageState createState() => new _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  String displayNum = "0";
  String calcNum = "";
  String operationSymbol = "";
  double result;
  bool shouldCalculate = false;

 void _calculate() {
      switch (operationSymbol) {
        case '+':
           result += double.parse(calcNum) ?? 0;
           break;
        case '-':
           result -= double.parse(calcNum) ?? 0;
           break;
        case 'x':
           result *= double.parse(calcNum) ?? 0;
           break;
        case '/':
           result /= double.parse(calcNum) ?? 0;
           break;
        default:
           break;
      }
      print(result);
     if (result.isNaN) result = 0;
     calcNum = result.toString();
     displayNum = calcNum;
 }

 void buttonPressed(String buttonText){
   setState(() {
     switch (buttonText) {
       case '+':
       case '-':
       case '*':
       case '/':
         if(shouldCalculate) {
           _calculate();
         } else {
           result = double.parse(calcNum) ?? 0;
           shouldCalculate = true;
         }
         calcNum = '';
         operationSymbol = buttonText;
         break;
      case '=':
          _calculate();
          operationSymbol = '';
          shouldCalculate = false;
          break;
      case 'clear':
          calcNum = '';
          displayNum = '0';
          operationSymbol = '';
          result = 0;
          shouldCalculate = false;
          break;
      default:
        calcNum += buttonText;
        displayNum = calcNum;
     }
   });
    print(buttonText);
  }

  Widget BuildButton(String buttonText){
     return new Expanded(
       child: new OutlineButton(
         padding: EdgeInsets.all(24),
         child: new Text(buttonText, style: 
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            )
         ),
         onPressed: () {
           buttonPressed(buttonText);
         }
        )
     );
  }
   Widget build(BuildContext context) {
     return new Scaffold(
        appBar: new AppBar(
          title: Text("Calculator Page"),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                alignment: Alignment.centerRight,
                padding: new EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 12.0
                ),
                child: new Text(
                  displayNum, style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              ),
              new Expanded(
                child: new Divider(),
              ),
              new Column(
                children:[
                    new Row(children: <Widget>[
                      BuildButton('7'),
                      BuildButton('8'),
                      BuildButton('9'),
                      BuildButton('/'),
                    ],),
                    new Row(children: <Widget>[
                      BuildButton('4'),
                      BuildButton('5'),
                      BuildButton('6'),
                      BuildButton('x')
                    ],),
                    new Row(children: <Widget>[
                      BuildButton('1'),
                      BuildButton('2'),
                      BuildButton('3'),
                      BuildButton('-'),
                    ],),
                    new Row(children: <Widget>[
                      BuildButton('.'),
                      BuildButton('0'),
                      BuildButton('00'),
                      BuildButton('+')
                    ],),
                    new Row(children: <Widget>[
                      BuildButton('clear'),
                      BuildButton('='),
                    ],)
                ]
              )
        
            ],
          ),
        ),
     );
   }
}
