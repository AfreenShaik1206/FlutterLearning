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
  _MyAppState createState() => _MyAppState();
}

class SecondRoute extends StatelessWidget {
   Widget build( BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
   }
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
            Container (
              margin: EdgeInsets.all(20),
              child : Text(fullName)
            ),
            
            Container (
             child: new Column(
              children: <Widget> [ 
                new RaisedButton(
                onPressed: (){
                  // Navigator.push(
                  //    context,
                  //     new MaterialPageRoute(
                  //    builder: (BuildContext context) =>
                  //    SecondRoute()));
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondRoute()));
                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                padding: EdgeInsets.all(8),
                child: Text("Submit"),
              ),
             ]), 
             ),
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