import 'package:database/image_data/Httpservices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Data.dart';

class HomeFile extends StatefulWidget {
  final String id;
  final String url;
  const HomeFile({Key? key,required this.id,required this.url}) : super(key: key);

  @override
  State<HomeFile> createState() => _HomeFileState();
}

class _HomeFileState extends State<HomeFile> {

  HttpServices httpServices = HttpServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Hero(
          tag: widget.id,
          child: Center(
            child: Image.network(widget.url),
          ),
        ),
      ),
    );
  }
}
