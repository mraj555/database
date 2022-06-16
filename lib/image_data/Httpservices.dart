import 'dart:convert';
import 'package:http/http.dart';
import 'Data.dart';

class HttpServices {
  Future<List<Data>>? getData() async {
    var res = await get(Uri.https('jsonplaceholder.typicode.com', 'photos'));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Data> posts =
          body.map((dynamic item) => Data.fromJson(item)).toList();

      return posts;
    }
    else {
      throw 'Can\'t Get Data';
    }
  }
}
