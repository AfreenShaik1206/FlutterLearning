import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import './itemList.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (BuildContext context) => firsrt_screen(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/second': (BuildContext context) => itemList(),
  },
));

class firsrt_screen extends StatelessWidget {
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
  int _counter = 0;

  Future<void> _shareImage() async {
    try {
      final ByteData bytes = await rootBundle.load('images/arrivals.jpg');
      await Share.file(
        'esys image', 'esys.png', bytes.buffer.asUint8List(), 'image/png', text: 'Buy these Produts and win exciting gifts');
      } catch(e) {
        print('error: $e');
      }
  }
  @override
  Widget build(BuildContext context) {
    
    final _controller = new PageController();
    const duration = const Duration(milliseconds: 300);
  
    // Future<void> share() async {
    //    await FlutterShare.share(
    //             linkUrl: 'https://futter.dev/'
    //     );
    // }
    final List<Widget> _pages = <Widget>[
         Image(image: AssetImage('images/kidsWear.jpg'),fit: BoxFit.contain),
         Image(image: AssetImage('images/summerSuit.jpg'),fit: BoxFit.contain),
         Image(image: AssetImage('images/arrivals.jpg'),fit: BoxFit.contain),
        
        // Container(
        //    child: Image(image: AssetImage('images/arrivals.jpg'), fit: BoxFit.fitWidth),
        //    decoration: BoxDecoration(
        //      borderRadius: BorderRadius.circular(16.0),
        //    ),
        //    margin: EdgeInsets.only(left: 3, right: 3),
        // ),
        // new ConstrainedBox(
        //   constraints: const BoxConstraints.expand(height: 190),
        //   child: Image(image: AssetImage('images/summerSuit.jpg'))
        // ),
        // new ConstrainedBox(
        //   constraints: const BoxConstraints.expand(),
        //   child: Image(image: AssetImage('images/arrivals.jpg'))
        // ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share), 
            onPressed: () async =>  await _shareImage()
          ),
          IconButton(
            icon: Icon(Icons.mail), 
            onPressed: () {
            
            }
          ),
          IconButton(
            icon: Icon(Icons.star), 
            onPressed: () {

            }
          )
        ]
      ),
      drawer: Drawer(
        child: ListView(children: <Widget>[
          DrawerHeader(
            child: Column(

            )
          )
        ],),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           Container(
             height: 210,
             decoration: BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                // stops: [0.5, 0.5],
                colors: [Colors.cyan,Colors.pink])
             ),
             child: Directionality(
               textDirection: TextDirection.rtl, 
               child: Column(children: <Widget>[
                 SizedBox(height: 14),
                 SizedBox(
                   height: 170,
                   child: PageView(
                     physics: const AlwaysScrollableScrollPhysics(),
                     controller: _controller,
                     children: List.generate(3, (i) =>  Container(
                         margin: EdgeInsets.only(left: 8, right: 8),
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(58),
                           child: _pages[i],
                         )
                        )),
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(top: 5),
                   child: SmoothPageIndicator(
                   controller: _controller,
                   count: 3,

                   effect: SlideEffect(
                     spacing: 8.0,
                     radius: 5.0,
                     dotWidth: 10.0,
                     dotHeight: 10.0,
                     paintStyle: PaintingStyle.stroke,
                     strokeWidth: 1.5,
                     dotColor: Colors.grey,
                     activeDotColor: Colors.white
                   )
                 ),
                 )
               ],)
      )
      ),
      Material(
        child: InkWell(
           onTap: () {
             Navigator.push(context, 
              new MaterialPageRoute(builder: (BuildContext context) => new itemList(value: 'ListPage'))
             );
           },
           child: Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              height: 150.0,
              child: Image(image: AssetImage('images/home-page-banner-m.jpg'), fit: BoxFit.fill),
           )
        )
        
        
      ),
      Container(
        color: Colors.deepPurpleAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Container(height: 30, 
            margin: EdgeInsets.only(top:10, bottom: 10),
            child: Text('Categories',textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0,  color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],)
      ),
      
      // Container(
      //   child: GridView.builder(
      //     itemCount: _pages.length
      //     gridDelegate: SilverGridDelegateWithFixedCrossAxisCount(crossAxisC), 
      //     itemBuilder: null
      //   ),
      // )
      
      // CustomScrollView(
      //   slivers: <Widget>[
      //     SliverPadding(
      //        padding: EdgeInsets.all(20),
      //        sliver: SliverGrid.count(
      //          crossAxisCount: 2,
      //          crossAxisSpacing: 5,
      //          mainAxisSpacing: 5,
      //          children: <Widget>[
      //            Container(
      //              padding: EdgeInsets.all(20),
      //              child: Image(image: AssetImage('images/arrivals.jpg'),fit: BoxFit.fill)
      //            ),
      //             Container(
      //              padding: EdgeInsets.all(20),
      //              child: Image(image: AssetImage('images/arrivals.jpg'),fit: BoxFit.fill)
      //            ),
      //          ],
      //        ),
      //     )
      //   ],
      // )
      ],),
    
      
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
