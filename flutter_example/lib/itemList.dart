import 'package:flutter/material.dart';
// import 'package:flutter_'
import './firsrt_screen.dart';


void main() => runApp(itemList());

class itemList extends StatelessWidget {
  // This widget is the root of your application.
  String value;
  itemList({this.value});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListPage(this.value)
    );
  }
}

class ListPage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  final String value;
  ListPage(this.value);
  @override
  _ListPageState createState() => _ListPageState(value);
}

class _ListPageState extends State<ListPage> {
  String value;
  _ListPageState(String value){
    this.value = value;
  }
  @override
  Widget build(BuildContext context) {
    
   final List<String> _images = [
         'images/image1.jpg',
         'images/image2.jpg',
         'images/image3.jpg',
         'images/image4.jpg',
         'images/image5.jpg',
         'images/image6.jpg',
         'images/image7.jpg',
         'images/image8.jpg',
         'images/image9.jpg',
         'images/image10.jpg',
         'images/image11.jpg',
         'images/image12.jpg',
         'images/image13.jpg',
         'images/image14.jpg',
         'images/image15.jpg',
         'images/image16.jpg',
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(value),
      ),
      body:  GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(5),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        
        children: _images.map((item) => Card(
          elevation: 5,
          color: Colors.grey[200],
          child: Container(
            height: 40,
             decoration: BoxDecoration(
               image: DecorationImage(image: AssetImage(item),fit: BoxFit.cover)
             ),
          )
        )).toList(),
      )
    );
  }
}
