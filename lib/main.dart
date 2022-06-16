import 'package:database/lay_out.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(
//     GetMaterialApp(
//       navigatorKey: navigatorKey,
//       locale: Locale('en','US'),
//       translations: MultiLanguage(),
//       debugShowCheckedModeBanner: false,
//       home: Layoout(),
//     ),
//   );
// }
//
final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Layoout(),
    ),
  );
}
