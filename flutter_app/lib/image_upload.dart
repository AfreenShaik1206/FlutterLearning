import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
    
      Widget build(BuildContext context) {
         return Center(
            child: RaisedButton(
              child: Text('Show Snackbar'),
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Hello! I am SnackBar :)"),
                      duration: Duration(seconds: 3),
                ));
              },
            ),
         );
      }
}
