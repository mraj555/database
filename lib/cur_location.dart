import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({Key? key}) : super(key: key);

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {

  String lat = '';
  String long = '';


  requestPermission() async {
    var status = await Permission.location.status;

    if(!status.isGranted || status.isDenied) {
      Permission.location.request();
    }
  }

  currentPos() async {
    var geopos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    setState(() {
      lat = '${geopos.latitude}';
      long = '${geopos.longitude}';
    });
  }

  @override
  void initState() {
    requestPermission();
    currentPos();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          centerTitle: true,
          title: Text('Geo Location'),
          elevation: 15,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Latitude :- $lat'),
              Text('Longitude :- $long'),
            ],
          ),
        ),
      ),
    );
  }
}
