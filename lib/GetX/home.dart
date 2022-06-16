import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale = [
      {'name': 'English', 'locale': Locale('en', 'US')},
      {'name': 'हिंदी', 'locale': Locale('hi', 'IN')},
      {'name': 'ગુજરાતી', 'locale': Locale('gu', 'IN')},
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('GetX'),
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'name'.tr,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                'surname'.tr,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                'age'.tr,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        'Select Language',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: Container(
                        width: double.maxFinite,
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => ListTile(
                                  onTap: () {
                                    updateLanguage(locale[index]['locale']);
                                  },
                                  title: Text(locale[index]['name'].toString()),
                                ),
                            separatorBuilder: (context, index) => Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                            itemCount: locale.length),
                      ),
                    ),
                  );
                },
                child: Text('Change Language'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  updateLanguage(locale) {
    Get.back();
    Get.updateLocale(locale);
  }
}
