import 'package:flutter/material.dart';


void main() => runApp(new_screen());

class new_screen extends StatelessWidget {
   // This widget is the root of your application.
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: DropDownExample(),
    );
  }
}

class DropDownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() {
      return _DropdownExampleState();
   }
}

class _DropdownExampleState extends State<DropDownExample> {
    String _value;

    Widget build(BuildContext context) {
      return Center( child: Column(children: <Widget>[
           Container(
             margin: EdgeInsets.all(20),
             child: DropdownButton(
               items: [
                 DropdownMenuItem(
                   child: Text("Java"),
                   value: "one",
                 ),
                 DropdownMenuItem(
                   child: Text("C"),
                   value: "Two",
                 ),
                 DropdownMenuItem(
                   child: Text("Database"),
                   value:  "Three",
                 )
               ], onChanged: (String val) {
                    setState(() {
                      _value = val;
                    });
               },
               hint: Text("Select a value"),
               value: _value,
              ),
           ),
           
           Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget> [
                  Image.network(
                     'https://github.com/nisrulz/flutter-examples/raw/develop/image_from_network/img/flutter_logo.png'),
                ]
              ),  
           ),

           Container(
             child: RaisedButton(
                 child: Text('Back To HomeScreen'),
                 color: Theme.of(context).primaryColor,
                 textColor: Colors.white,
                  onPressed: () => Navigator.pop(context)
              ),
           )
      ],)
        
      );
    }
}