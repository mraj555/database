import 'package:database/Https_tutorial/httpservices.dart';
import 'package:database/Https_tutorial/post.dart';
import 'package:flutter/material.dart';

class HttpGet extends StatefulWidget {
  const HttpGet({Key? key}) : super(key: key);

  @override
  State<HttpGet> createState() => _HttpGetState();
}

class _HttpGetState extends State<HttpGet> {
  @override
  Widget build(BuildContext context) {
    HttpServices httpServices = HttpServices();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 15,
          title: Text('Http Data Get'),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
          future: httpServices.getPost(),
          builder: (context, snapshot) {
            List<Post>? posts = snapshot.data as List<Post>?;

            if (snapshot.hasData) {
              return ListView(
                children: posts!
                    .map(
                      (Post post) => Padding(
                        padding: const EdgeInsets.fromLTRB(5,10,5,0),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'ID : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: post.id.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'USER ID : ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: post.userId.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'TITLE : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                    ),
                                    children: [
                                      TextSpan(
                                        text: post.title.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
