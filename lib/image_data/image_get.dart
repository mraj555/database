import 'package:database/image_data/Httpservices.dart';
import 'package:database/image_data/home_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Data.dart';

class ImageGet extends StatefulWidget {
  const ImageGet({Key? key}) : super(key: key);

  @override
  State<ImageGet> createState() => _ImageGetState();
}

class _ImageGetState extends State<ImageGet> {
  HttpServices httpServices = HttpServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 15,
          title: Text('Image Data'),
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: httpServices.getData(),
          builder: (context, snapshot) {
            List<Data>? posts = snapshot.data as List<Data>?;

            if (snapshot.hasData) {
              return ListView(
                children: posts!
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                        child: Card(
                          elevation: 15,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeFile(id: e.id.toString(),url: e.url.toString()),
                                ),
                              );
                            },
                            leading: GestureDetector(
                              child: Hero(
                                tag: e.id.toString(),
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(e.thumbnailUrl.toString()),
                                  radius: 25,
                                ),
                              ),
                            ),
                            title: Text(
                              'AlbumId : ${e.albumId.toString()}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Title : ${e.title.toString()}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
