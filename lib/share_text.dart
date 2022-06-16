import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareText extends StatefulWidget {
  const ShareText({Key? key}) : super(key: key);

  @override
  State<ShareText> createState() => _ShareTextState();
}

class _ShareTextState extends State<ShareText> {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 15,
          title: Text('Share Text'),
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
            ),
            SizedBox(
              height: 20,
            ),
            IconButton(
              onPressed: () async {
                await Share.share(_controller.text);
              },
              icon: Icon(Icons.share),
            ),
          ],
        ),
      ),
    );
  }
}
