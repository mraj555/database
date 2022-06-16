import 'dart:convert';

import 'package:database/Complex_List_Json/Complex_List_Model.dart';
import 'package:http/http.dart';

class ComplexListHttpServices {
  
  Future<List<Model>> getData() async {
    var res = await get(Uri.https('fakestoreapi.com', 'carts'));

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