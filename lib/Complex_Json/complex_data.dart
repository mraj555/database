import 'package:database/Complex_Json/complex_httpservices.dart';
import 'package:database/Complex_Json/complex_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComplexData extends StatefulWidget {
  const ComplexData({Key? key}) : super(key: key);

  @override
  State<ComplexData> createState() => _ComplexDataState();
}

class _ComplexDataState extends State<ComplexData> {
  @override
  Widget build(BuildContext context) {
    ComplexHttpServices httpServices = ComplexHttpServices();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          title: Text('Complex Data'),
          elevation: 15,
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
          future: httpServices.getData(),
          builder: (context, snapshot) {
            List<Model>? posts = snapshot.data as List<Model>?;

            if (snapshot.hasData) {
              return ListView(
                children: posts!
                    .map(
                      (e) => Container(
                        color: Colors.black,
                        margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'ID : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: '${int.parse(e.id.toString())}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'NAME : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: e.name.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'USERNAME : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: e.username.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'EMAIL : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: e.email.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(color: Colors.white, thickness: 1),
                            RichText(
                              text: TextSpan(
                                text: 'ADDRESS :- ',
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                              thickness: 1,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'STREET : ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none),
                                children: [
                                  TextSpan(
                                    text: e.address!.street.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none),
                                  ),
                                  TextSpan(
                                    text: '\nSUITE : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none),
                                  ),
                                  TextSpan(
                                    text: e.address!.suite.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none),
                                  ),
                                  TextSpan(
                                    text: '\nCITY : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none),
                                  ),
                                  TextSpan(
                                    text: e.address!.city.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none),
                                  ),
                                  TextSpan(
                                    text: '\nZIPCODE : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none),
                                  ),
                                  TextSpan(
                                    text: e.address!.zipcode.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.white, thickness: 1),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'PHONE : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: e.phone.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'WEBSITE : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: e.website.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(color: Colors.white, thickness: 1),
                            RichText(
                              text: TextSpan(
                                text: 'COMPANY :- ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellowAccent,
                                  decoration: TextDecoration.underline,
                                  decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                              thickness: 1,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'NAME : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                                children: [
                                  TextSpan(
                                    text: e.company!.name.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none),
                                  ),
                                  TextSpan(
                                    text: '\nCATCHPHRASE : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none),
                                  ),
                                  TextSpan(
                                    text: e.company!.catchPhrase.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none),
                                  ),
                                  TextSpan(
                                    text: '\nBS : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none),
                                  ),
                                  TextSpan(
                                    text: e.company!.bs.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
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
