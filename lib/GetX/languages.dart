import 'package:get/get.dart';

class MultiLanguage extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US' : {
      'name' : 'Sahil',
      'surname' : 'Patel',
      'age' : '24'
    },
    'hi_IN' : {
      'name' : 'साहिल',
      'surname' : 'पटेल',
      'age' : '२४'
    },
    'gu_IN' : {
      'name': 'સાહિલ',
      'surname' : 'પટેલ',
      'age' : '૨૪'
    }
  };
}