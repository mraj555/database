import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PushNotification extends StatefulWidget {
  const PushNotification({Key? key}) : super(key: key);

  @override
  State<PushNotification> createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Push Notifications'),
          centerTitle: true,
          elevation: 15,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Push Notifications'),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
