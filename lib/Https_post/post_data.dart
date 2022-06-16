import 'package:database/Https_post/httpser.dart';
import 'package:database/Https_post/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostData extends StatefulWidget {
  const PostData({Key? key}) : super(key: key);

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  var _controller = TextEditingController();

  Model? createData;

  HttpSer httpSer = HttpSer();

  bool show = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 15,
          title: Text('Post Data'),
          backgroundColor: Colors.black,
          centerTitle: true,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        body: Column(
          children: [
            TextField(
              controller: _controller,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                Model data = await httpSer.postData(_controller.text);

                setState(
                  () {
                    createData = data;
                    show = true;
                  },
                );
              },
              child: Text(show==false ? 'OK' : 'Done'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(createData == null ? '' : '${createData!.id.toString()} & ${createData!.title.toString()}'),
          ],
        ),
      ),
    );
  }
}
