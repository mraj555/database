import 'dart:convert';

import 'package:database/Complex_Json/complex_model.dart';
import 'package:http/http.dart';

class ComplexHttpServices {
  Future<List<Model>> getData() async {
    var res = await get(Uri.https('jsonplaceholder.typicode.com', 'users'));

    if(res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Model> posts = body.map((e) => Model.fromJson(e)).toList();

      return posts;
    }
    else{
      throw 'Can\'t Get Data';
    }
  }
}