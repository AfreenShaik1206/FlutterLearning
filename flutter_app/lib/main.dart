import 'package:flutter/material.dart';
import './new_screen.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (context) => MyApp(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/second': (context) => new_screen(),
  },
));

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

class _MyAppState extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String fullName = '';
  String password = '';
  String message = "HelloWorld";
  bool checkBoxValue = false;

  AlertDialog dialog = AlertDialog(
     content : Text( "HelloWorld" , style: TextStyle( fontSize: 30 ,))
  );
  AlertDialog emailDialog = AlertDialog(
     content : Text( "Email is Can't be blank." , style: TextStyle( fontSize: 30 ,))
  );
  AlertDialog validEmaildialog = AlertDialog(
     content : Text( "Enter a valid Email." , style: TextStyle( fontSize: 30 ,))
  );
  AlertDialog passwordDialog = AlertDialog(
     content : Text( "PassWord can't be blank." , style: TextStyle( fontSize: 30 ,))
  );
  AlertDialog validPassworddialog = AlertDialog(
     content : Text( "Password should be in between 8 to 12" , style: TextStyle( fontSize: 30 ,))
  );

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Demo'),
          ),
          body: Center(child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Text("Flutter Kart" , 
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize:  30,
                          fontWeight: FontWeight.w500,
                        )),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text("Sign in", 
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                      )
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    
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
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  onChanged: (text) {
                    setState(() {
                      password = text;
                      //you can access nameController in its scope to get
                      // the value of text entered as shown below
                      //fullName = nameController.text;
                    });
                  },
                ),
                 
                ),

                Container (
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: <Widget>[
                      new Checkbox(
                        value: checkBoxValue,
                        onChanged: (bool val) {
                          setState(() {
                            checkBoxValue = val;
                          });
                          Text('Remember me');
                        }
                      ),
                      Text('Remember me'),
                    ],
                  ),
                ),
             FlatButton(
               onPressed: () {
                 showDialog(context: context, builder: (BuildContext context) => dialog);
               },
               child: Text('Forgot Password', style: TextStyle( color: Colors.blue )),
              ),
            Container (
              height: 40,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child : RaisedButton(
                onPressed: (){
                  if(fullName  == ""){
                    showDialog(context: context, builder: (BuildContext context) => emailDialog);
                  } else if ( !(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(fullName))) {
                    showDialog(context: context, builder: (BuildContext context) => validEmaildialog);
                  }else if (password == "") {
                     showDialog(context: context, builder: (BuildContext context) => passwordDialog);
                  } else if( password.length < 9 || password.length > 13){
                      showDialog(context: context, builder: (BuildContext context) => validPassworddialog);
                  }else {
                  // Navigator.pushNamed(context, new_screen());
                       Navigator.push(
                          context,
                          new MaterialPageRoute(
                             builder: (BuildContext context) =>
                            new_screen()));
                  }
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondRoute()));
                },
                textColor: Colors.white,
                color: Colors.blueAccent,
                child: Text("Login"),
              ), 
             ),
             
             Container(
               margin: EdgeInsets.fromLTRB(50, 0, 10, 0),
               padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
               alignment: Alignment.center,
               child: Row(
                 children: <Widget>[
                   Text("Does not have account?"),
                   FlatButton(
                     onPressed: null,
                     child: Text('Sign in',
                           style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue
                           ),
                         )
                   )
                 ]
               ),
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