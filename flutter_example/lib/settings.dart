import 'package:flutter/material.dart';
// import 'package:flutter_'
import './firsrt_screen.dart';


void main() => runApp(settings());

class settings extends StatelessWidget {
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListPage()
    );
  }
}

class ListPage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Settings'),
      ),
      body: Text('Settings')
    );
  }
}
