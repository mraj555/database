import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentsData extends StatefulWidget {
  CollectionReference studentdata;

  StudentsData({Key? key, required this.studentdata}) : super(key: key);

  @override
  State<StudentsData> createState() => _StudentsDataState();
}

class _StudentsDataState extends State<StudentsData> {

  List<Map> data = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          title: Text('Students Data'),
          centerTitle: true,
          elevation: 15,
        ),
        body: ListView(
          children: List.generate(
            data.length,
            (index) => Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 5,right: 5),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID : ${data[index]['ID']}'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Name : ${data[index]['NAME']}'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Mobile No.: ${data[index]['MOBILE NO']}'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Email : ${data[index]['EMAIL']}'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Password : ${data[index]['PASSWORD']}'),
                      SizedBox(
                        height: 10,
                      ),
                      ButtonBar(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
