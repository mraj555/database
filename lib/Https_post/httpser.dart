import 'package:database/Https_post/model.dart';
import 'package:http/http.dart';

class HttpSer {
  Future<Model> postData(String title) async {
    var res = await post(
      Uri.https('jsonplaceholder.typicode.com', 'albums'),
      body: {'title' : title}
    );

    if(res.statusCode == 201) {
      return modelFromJson(res.body);
    }
    else{
      throw 'Can\'t Post Data';
    }
  }
}
