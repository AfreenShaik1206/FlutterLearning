import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './countriesList.dart';
import './calculator.dart';
import './image_upload.dart';
// GlobalKey<_StepperExample>  globalKey = GlobalKey();
void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (context) => new_screen(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/second': (context) => countriesList(),
    '/third': (context) => calculator(),
    '/fourth': (context) => image_upload(),
  },
));

class new_screen extends StatelessWidget {
   // This widget is the root of your application.
   Widget build(BuildContext context) {
     
     return MaterialApp(
       home: DefaultTabController(
         length: 3, 
         child: Scaffold(
             appBar: AppBar(
                title: Text('Second Screen'),
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.directions_car)),
                    Tab(icon: Icon(Icons.directions_railway)),
                    Tab(icon: Icon(Icons.directions_walk))
                  ],
                ),
             ),
              body:  TabBarView(
                children: [
                  StepperExample(),
                  DropDownExample(),
                  BottomNavigationExample(),
                  // Icon(Icons.directions_walk)
                ],
              ),
              drawer:  Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                     DrawerHeader(
                       child: Column(children: <Widget>[
                         Container(
                           child: Text('Drawer Header'),
                         ),
                         Container(
                           alignment: Alignment.topLeft,
                           child: Image.network(
                     'https://github.com/nisrulz/flutter-examples/raw/develop/image_from_network/img/flutter_logo.png'),
                         )
                       ],) ,
                       decoration: BoxDecoration( 
                         color: Colors.blue,
                       ),
                     ),
                     ListTile(
                       title: Text('Item1'),
                       onTap: () {
                         Navigator.pop(context);
                       } 
                     ),
                     ListTile(
                       title: Text('Item2'),
                       onTap: (){
                         Navigator.pop(context);
                       }
                     ),
                     ListTile(
                       title: Text('Item3'),
                       onTap: (){
                         Navigator.pop(context);
                       },
                     )
                  ],
                ),
              ),
             floatingActionButton: FloatingActionButton(
                   onPressed: (){
                      // print(globalKey.currentState.current_Step);
                      //  if(globalKey.currentState.current_Step == 0 ) {
                      //    globalKey.currentState.dialogShow();
                      //  } else {
                         Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                  calculator()));
                      //  }
                   },
                   tooltip: 'Increment',
                   child: Icon(Icons.add),
              ),
          ),
       )
     );
  }
}

class BottomNavigationExample extends StatefulWidget {
   _BottomNavigationExample createState() {
     return _BottomNavigationExample();
   }
}

class _BottomNavigationExample extends State<BottomNavigationExample> {
     int _selectedIndex = 0;
     static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
     static const List<Widget> _widgetOptions = <Widget> [
        Text(
           'Index 0: Home',
            style: optionStyle,
        ),
        Text(
          'Index 1: Business',
           style: optionStyle,
        ),
        
        Text(
          'Index 2: School',
           style: optionStyle,
        )
     ];

     void _onItemTapped(int index) {
         setState(() {
           _selectedIndex = index;
         });
     }
    @override
    Widget build(BuildContext context) {
       return Scaffold(
          body: GridViewExample(),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                title: Text('Business'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                title:Text('School'),
              )
            ],
            currentIndex: _selectedIndex,
            selectedItemColor:  Colors.amber[800],
            onTap: _onItemTapped,
          ),
       );
    }   
}

class GridViewExample extends StatefulWidget {
    @override
    _GridViewState createState() {
      return _GridViewState(); 
    }
}

class _GridViewState extends State<GridViewExample> {
   Widget build(BuildContext context) {
     return CustomScrollView(
         slivers: <Widget>[
           SliverPadding(
             padding: EdgeInsets.all(20),
             sliver: SliverGrid.count(
               crossAxisCount: 2,
               crossAxisSpacing: 10,
               mainAxisSpacing: 10,
               children: <Widget>[
                 Container(
                   padding: EdgeInsets.all(8),
                   child: Icon(Icons.face),
                   color: Colors.lightBlue,
                 ),
                 Container(
                   padding: EdgeInsets.all(8),
                   child: Icon(Icons.face),
                   color: Colors.lightBlue,
                 ),
                 Container(
                   padding: EdgeInsets.all(8),
                   child: Icon(Icons.face),
                   color: Colors.lightBlue,
                 ),
                 Container(
                   padding: EdgeInsets.all(8),
                   child: Icon(Icons.face),
                   color: Colors.lightBlue,
                 ),
                 Container(
                   padding: EdgeInsets.all(8),
                   child: Icon(Icons.face),
                   color: Colors.lightBlue,
                 ),
                 Container(
                   padding: EdgeInsets.all(8),
                   child: Icon(Icons.face),
                   color: Colors.lightBlue,
                 ),
                 Container(
                   padding: EdgeInsets.all(8),
                   child: Icon(Icons.face),
                   color: Colors.lightBlue,
                 ),
                 Container(
                   padding: EdgeInsets.all(8),
                   child: Icon(Icons.face),
                   color: Colors.lightBlue,
                 )
               ],
              )
            )
         ],
     );
   }
}

class StepperExample extends StatefulWidget {
  // StepperExample({Key key }) : super(key: key);
   @override
   _StepperExample createState() {
        return  _StepperExample();
   }
}

class _StepperExample extends State<StepperExample> {
   int current_Step = 0;

    AlertDialog dialog = AlertDialog(
       content: Text('No Trains Available', style: TextStyle(fontSize: 30, color: Colors.black)),
     );
   void dialogShow() {
     showDialog(context: context, builder: (BuildContext context) => dialog);
   }

   List<Step> my_steps = [
     Step(
         title: Text('First'), 
         subtitle: Text("This is our first article"),
         isActive: true,
         content: Text(
                "In this article, I will tell you how to create a page."),
         state: StepState.indexed
     ),
     Step(
          title: Text('Second'),
          subtitle: Text('Constructor'),
          content: Text("Let's look at its Controller"),
          isActive: true,
          state: StepState.editing
     ),
     Step(
          title: Text('Third'),
          subtitle: Text('Final Step'),
          content: Text('Lets Complete this Step'),
          isActive: true,
          state: StepState.complete
     )
  ];
   @override
   Widget build(BuildContext context) {
     return Center(
       child: Column(children: <Widget>[
         Container(
           margin: EdgeInsets.all(10),
           color: Colors.white,
           child: Stepper(
             currentStep: this.current_Step,
             steps: my_steps,
             type: StepperType.vertical,
             onStepTapped: (step){
                current_Step = step;
             },
             onStepCancel: (){
               setState(() {
                 if(current_Step>0) {
                   current_Step = current_Step-1;
                 } else {
                   current_Step = 0;
                 }
               });
             },
             onStepContinue: (){
               setState(() {
                 if(current_Step<my_steps.length-1){
                   current_Step = current_Step+1;
                 }else {
                   current_Step = 0;
                 }
               });
             },
            ),
         )
       ],)
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
    DateTime dateAndTime;
    Widget build(BuildContext context) {
      return Center( child: Column(children: <Widget>[
        Container(
           height:  40,
        ),
           Container(
              height: 150,
              child: PageView(
                controller: PageController(
                   viewportFraction: 0.8,
                ),
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.redAccent,
                    width: 100,
                    child: Column(
                       children: <Widget>[
                         Container(
                           margin: EdgeInsets.fromLTRB(10, 10, 5, 0),
                           alignment: Alignment.topLeft,
                           child: Text('Main Activity', style:TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white))
                         ),
                         Container(
                           margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                           child: Text('This is the Main Activity. For a more detailed help message, Press h.To detch, press d;to quit q. ', style:TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal))
                         )
                       ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.blueAccent,
                    width: 100,
                    child: Column(
                       children: <Widget>[
                         Container(
                           margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                           alignment: Alignment.topLeft,
                           child: Text('Main Activity', style:TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white))
                         ),
                         Container(
                           margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                           child: Text('This is the Main Activity. For a more detailed help message, Press h.To detch, press d;to quit q. ', style:TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal))
                         )
                       ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.greenAccent,
                    width: 100,
                    child: Column(
                       children: <Widget>[
                         Container(
                           margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                           alignment: Alignment.topLeft,
                           child: Text('Main Activity', style:TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white))
                         ),
                         Container(
                           margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                           child: Text('This is the Main Activity. For a more detailed help message, Press h.To detch, press d;to quit q. ', style:TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal))
                         )
                       ],
                    ),
                  )
                ],
              ),
           ),
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
              child: Text( dateAndTime == null ? 'Nothing has picked yet.' : dateAndTime.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
              ),
           ),
           Container(
             child: FlatButton(
               child: Text('Show DateTime picker', style: TextStyle( color: Colors.blue)),
               onPressed: (){
                    showDatePicker(context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2222)
                    ).then((date) {
                       setState(() {
                         dateAndTime = date;
                       });
                    });
              },
             )
           ),
           Container(
             child: RaisedButton(
                 child: Text('Countries List'),
                 color: Theme.of(context).primaryColor,
                 textColor: Colors.white,
                  onPressed: (){
                    Navigator.push(
                     context,
                      new MaterialPageRoute(
                     builder: (BuildContext context) =>
                     countriesList()));
                  }
              ),
           ),
           Container(
             child: RaisedButton(
                 child: Text('Image Upload'),
                 color: Theme.of(context).primaryColor,
                 textColor: Colors.white,
                  onPressed: (){
                          Navigator.push(
                              context,
                             new MaterialPageRoute(
                             builder: (BuildContext context) =>
                           image_upload()));
                 }
              ),
           ),
           Container(

           )
      ],)
        
      );
    }
}