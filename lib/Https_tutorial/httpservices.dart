import 'dart:convert';

import 'package:database/Https_tutorial/post.dart';
import 'package:http/http.dart';

class HttpServices {

  Future<List<Post>> getPost() async {
    var res = await get(Uri.https('jsonplaceholder.typicode.com', 'albums'));

    if(res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    }
    else{
      throw 'Can\'t get Data!';
    }
  }
}