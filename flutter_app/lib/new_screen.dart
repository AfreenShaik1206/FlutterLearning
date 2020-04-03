import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './countriesList.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (context) => new_screen(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/second': (context) => countriesList(),
  },
));

class new_screen extends StatelessWidget {
   // This widget is the root of your application.
   Widget build(BuildContext context) {
     AlertDialog dialog = AlertDialog(
       content: Text('No Trains Available', style: TextStyle(fontSize: 30, color: Colors.black)),
     );
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
              body: TabBarView(
                children: [
                  StepperExample(),
                  DropDownExample(),
                  Icon(Icons.directions_walk)
                ]
              ),
             floatingActionButton: FloatingActionButton(
                   onPressed: (){
                     showDialog(context: context, builder: (BuildContext context) => dialog);
                   },
                   tooltip: 'Increment',
                   child: Icon(Icons.add),
              )
          ),
       )
     );
  }
}

class StepperExample extends StatefulWidget {
   @override
   _StepperExample createState() {
        return  _StepperExample();
   }
}

class _StepperExample extends State<StepperExample> {
   int current_Step = 0;
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

           )
      ],)
        
      );
    }
}