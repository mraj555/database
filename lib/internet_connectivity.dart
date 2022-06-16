import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternetConnect extends StatefulWidget {
  const InternetConnect({Key? key}) : super(key: key);

  @override
  State<InternetConnect> createState() => _InternetConnectState();
}

class _InternetConnectState extends State<InternetConnect> {
  String result = '';
  String type = '';
  String url = '';

  @override
  void initState() {
    checkConnetion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(elevation: 15, title: Text('Internet Connection'), centerTitle: true, titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), backgroundColor: Colors.black),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Result :- $result'),
              SizedBox(
                height: 10,
              ),
              Text('Types :- $type'),
              SizedBox(
                height: 10,
              ),
              url == ''
                  ? SizedBox()
                  : Image.network(
                      url,
                      height: 100,
                      width: 100,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  checkConnetion() {
    Connectivity().checkConnectivity().then(
          (value) {
            print(value.name);
            if(value.name == 'none') {
              setState(() {
                this.result = 'Not Connected';
                url = '';
                type = '';
              });
            }
            print('NO');
          },
        );
    Connectivity().onConnectivityChanged.listen(
      (result) {
        if (result == ConnectivityResult.wifi) {
          setState(() {
            this.result = 'Connected';
            type = 'Wi-Fi';
            url = 'https://www.seekpng.com/png/detail/121-1214638_wireless-icon-transparent-wifi-icon.png';
          });
        } else if (result == ConnectivityResult.ethernet) {
          setState(() {
            this.result = 'Connected';
            type = 'LAN';
            url = 'https://cdn-icons-png.flaticon.com/512/73/73400.png';
          });
        } else if (result == ConnectivityResult.bluetooth) {
          setState(() {
            this.result = 'Connected';
            type = 'Bluetooth';
            url = 'https://i.dlpng.com/static/png/441525_preview.png';
          });
        } else if (result == ConnectivityResult.mobile) {
          setState(() {
            this.result = 'Connected';
            type = 'Mobile';
            url = 'https://cdn-icons-png.flaticon.com/512/2282/2282299.png';
          });
        } else {
          setState(() {
            this.result = 'Not Connected';
            url = '';
            type = '';
          });
        }
      },
    );
  }
}
