import 'package:flutter/material.dart';
import 'dart:async';
import './firsrt_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   void initState() {

     super.initState();
     Timer(Duration(seconds: 5), () => 
         Navigator.push(context, new MaterialPageRoute(
           builder: (BuildContext context) => first_screen()
         ))
     );
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                 flex: 2,
                 child: Container(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       CircleAvatar(
                         backgroundColor: Colors.white,
                         radius: 50.0,
                         child: Icon(
                           Icons.shopping_cart,
                           color: Colors.greenAccent,
                           size: 50.0
                         ),
                       ),
                       Padding(padding: EdgeInsets.only(top: 10.0)),
                       Text(
                         "FlutKart", style: TextStyle(
                           color: Colors.white,
                           fontSize: 24.0,
                           fontWeight: FontWeight.bold
                         )
                       )
                     ],
                   ),
                 ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Text("Only Store \n For Everyone", style: TextStyle(color: Colors.white, fontSize: 10.0, fontWeight: FontWeight.bold),)
                  ],
                ),
              )
            ],
          )
        ],
      )
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
