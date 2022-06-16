import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MakeCall extends StatefulWidget {
  const MakeCall({Key? key}) : super(key: key);

  @override
  State<MakeCall> createState() => _MakeCallState();
}

class _MakeCallState extends State<MakeCall> {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          centerTitle: true,
          title: Text('Make Call'),
          elevation: 15,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _controller,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                ),
                SizedBox(
                  height: 20,
                ),
                IconButton(
                  onPressed: () => launch('tel:${_controller.text}'),
                  icon: Icon(Icons.call),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    ByteData imagebyte =
                        await rootBundle.load('assets/image.jpg');
                    final temp = await getTemporaryDirectory();

                    final path = '${temp.path}/image.jpg';

                    File(path).writeAsBytesSync(imagebyte.buffer.asUint8List());

                    await Share.shareFiles(
                      [path],
                      text: 'Lukhi Gautam',
                    );
                  },
                  child: Text('Share Asset Image'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final imageurl =
                        'https://tinypng.com/images/social/developer-api.jpg';
                    final uri = Uri.parse(imageurl);
                    final res = await http.get(uri);
                    final bytes = res.bodyBytes;

                    final temp = await getTemporaryDirectory();
                    final path = '${temp.path}/image.jpg';
                    print(path);
                    File(path).writeAsBytesSync(bytes);

                    await Share.shareFiles(
                      [path],
                      text: 'Vadil',
                    );
                  },
                  child: Text('Share Network Image'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
