import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import './message.dart';
import 'package:flutter_local_notifications/src/platform_specifics/android/message.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

void main() => runApp(countriesList());

class countriesList extends StatelessWidget {
   // This widget is the root of your application.
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countries'),
      ),
      body: BodyLayout(),
    );
  }
}

class BodyLayout extends StatefulWidget {
  @override
  _notification createState() {
    return _notification();
  }
  // Widget build(BuildContext context) {
  //     return _myListView(context);
  //   }
}

class _notification extends State<BodyLayout> {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    final List<Message> messages = []; 
    Widget build(BuildContext context) {
     final europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria', 
        'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
        'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
        'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
        'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
        'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
        'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
        'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden', 
        'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];
      return ListView.builder(
        itemCount: europeanCountries.length,
        itemBuilder: (context, index) {
          return ListTile(
                  title: Text(europeanCountries[index]),
          );
        },
      );
}
   
    void initState() {    
       super.initState();
       var android = new AndroidInitializationSettings('mipmap/ic_launcher');
       var ios = new IOSInitializationSettings();
       var platform = new InitializationSettings(android, ios);
       flutterLocalNotificationsPlugin.initialize(platform);

       _firebaseMessaging.configure(
          onMessage: (Map<String, dynamic> message) async {
             print("OnMessage: $message");
             final notification = message['notification'];
              showNotification(message);
            //  setState(() {
            //    messages.add(Message(
            //      title: notification["title"],
            //      body:  notification["body"]
            //     ));
            //  });
          },
          onLaunch:  (Map<String, dynamic> message) async {
            print("OnLaunch: $message");
          },
          onResume:  (Map<String, dynamic> message) async {
            print("OnResume: $message");
          }
       );
       _firebaseMessaging.requestNotificationPermissions(
          const IosNotificationSettings(sound: true, badge: true, alert: true)
       );
    }

    showNotification(Map<String, dynamic> message)  async{
       var android = new AndroidNotificationDetails('channel_id',"channel_name",
       "channelDescription");
       var ios = new IOSNotificationDetails();
       var platform = new NotificationDetails(android, ios);
       await flutterLocalNotificationsPlugin.show(0, "Flutter_app", "message" , platform);
    }
    // Widget build(BuildContext context)=> ListView (
    //   children: messages.map(buildMessage).toList(),
    // );

    // Widget buildMessage(Message message) => ListTile(
    //   title:  Text(message.title),
    //   subtitle: Text(message.body),
    
    // );
      
}

