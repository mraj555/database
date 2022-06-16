import 'package:database/Complex_List_Json/Complex_List_HttpServices.dart';
import 'package:database/Complex_List_Json/Complex_List_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ComplexListData extends StatefulWidget {
  const ComplexListData({Key? key}) : super(key: key);

  @override
  State<ComplexListData> createState() => _ComplexListDataState();
}

class _ComplexListDataState extends State<ComplexListData> {
  @override
  Widget build(BuildContext context) {
    ComplexListHttpServices httpServices = ComplexListHttpServices();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Complex List Data'),
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: httpServices.getData(),
          builder: (context, snapshot) {
            List<Model>? posts = snapshot.data as List<Model>?;

            if (snapshot.hasData) {
              return ListView(
                children: posts!
                    .map(
                      (e) => Card(
                        margin: EdgeInsets.all(10),
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ID : ${e.id.toString()}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'USERID : ${e.userId.toString()}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'DATE : ${DateFormat('dd-MM-yyyy').format(DateTime.parse(e.date.toString()))}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                color: Colors.green,
                                thickness: 2,
                              ),
                              for (int i = 0; i < e.products!.length; i++)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PRODUCT ID :- ${e.products![i].productId}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                        'QUANTITY :- ${e.products![i].quantity}'),
                                    Divider(
                                      color: Colors.green,
                                      thickness: 1,
                                    ),
                                  ],
                                )
                            ],
                          ),
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
