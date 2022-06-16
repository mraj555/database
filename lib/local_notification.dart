import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification extends StatefulWidget {
  const LocalNotification({Key? key}) : super(key: key);

  @override
  State<LocalNotification> createState() => _LocalNotificationState();
}

class _LocalNotificationState extends State<LocalNotification> {
  FlutterLocalNotificationsPlugin? _plugin;

  @override
  void initState() {
    var androidSetting = AndroidInitializationSettings('ic_launcher');
    var iosSetting = IOSInitializationSettings();
    var settings =
        InitializationSettings(android: androidSetting, iOS: iosSetting);

    _plugin = FlutterLocalNotificationsPlugin();
    _plugin!.initialize(settings, onSelectNotification: onSelect);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Local Notification'),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          centerTitle: true,
          elevation: 15,
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Show Notification'),
            onPressed: () {
              showNotification();
            },
          ),
        ),
      ),
    );
  }

  showNotification() {
    var androidDetails = AndroidNotificationDetails('channelId', 'channelName');
    var iosDetails = IOSNotificationDetails();
    var details = NotificationDetails(android: androidDetails, iOS: iosDetails);

    _plugin!.show(0, 'Flutter', 'Welcome to Flutter', details);
  }

  void onSelect(String? payload) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('You Tap On Notification'),
        title: Text(
          'Notification',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
