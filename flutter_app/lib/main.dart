import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
   // This widget is the root of your application.
  //  @override
  //  Widget build(BuildContext context) {
  //     return MaterialApp(
  //        title: 'Hello World Demo Application',
  //        theme: ThemeData(
  //           primarySwatch: Colors.blue,
  //        ),
  //        home: MyHomePage(title: 'Home page'),
  //     );
  //  }
   @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  String fullName = '';
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter - tutorialkart.com'),
          ),
          body: Center(child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                  onChanged: (text) {
                    setState(() {
                      fullName = text;
                      //you can access nameController in its scope to get
                      // the value of text entered as shown below
                      //fullName = nameController.text;
                    });
                  },
                )),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(fullName),
            )
          ]))),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//    MyHomePage({Key key, this.title}) : super(key: key);
//    final String title;

//    @override
//    Widget build(BuildContext context) {
//       return Scaffold(
//          appBar: AppBar(
//             title: Text(this.title),
//          ),
//          body: Center(
//            child:
//              TextField(
//                decoration: InputDecoration(
//                  border: InputBorder.none,
//                  hintText: 'Enter a search term',
//                )
//              ),
//          ),
//       );
//    }
// }