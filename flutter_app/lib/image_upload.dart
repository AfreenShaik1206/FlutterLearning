import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(image_upload());

class image_upload extends StatelessWidget {
   // This widget is the root of your application.
   Widget build(BuildContext context) {
    
     return MaterialApp(
       title: 'Uploading Image',
       theme: new ThemeData(
          primarySwatch: Colors.blue,
          
       ),
       home: new Image_uploadPage(title: "Calculator"),
     );
  }
}

class Image_uploadPage extends StatefulWidget {
  @override
   Image_uploadPage({Key key, this.title}): super(key: key);
   final title;
 _ImageuploadPageState createState() => new _ImageuploadPageState();
}

class _ImageuploadPageState extends State<Image_uploadPage> {
     Map data;
     Map data1 = {
       'key1': 1,
       'key2': "some text"
     };
     List userData;


     Future getData() async {
       http.Response response = await http.get("https://reqres.in/api/users?page=2");
       data = json.decode(response.body);
       setState(() {
         userData = data["data"];
       });
      //  debugPrint(response.body);

     }
     
     void foo() async {
            String body = json.encode(data1);
            http.Response response = await http.post(
               'https://example.com',
               headers:  {'Content-Type': "application/json"},
               body: body,
            );
            // debugPrint(response.body);
     }

     @override
      void initState() {
        super.initState();
          getData();
          foo();
      }

      Widget build(BuildContext context) {
         return Scaffold(
            appBar: AppBar(
              title: Text('Fake Friends'),
              backgroundColor: Colors.green,
            ),
            body: ListView.builder(
              itemCount: userData == null ? 0 : userData.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                   child: Row(children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(userData[index]["avatar"]),
                      ),
                      Text(
                        "${userData[index]["first_name"]} ${userData[index]["last_name"]}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700
                        ),
                      )
                   ],
                  ),
                );
              }
            )              
         );
      }
}
