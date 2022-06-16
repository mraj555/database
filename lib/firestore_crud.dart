import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FireStoreCRUD extends StatefulWidget {
  const FireStoreCRUD({Key? key}) : super(key: key);

  @override
  State<FireStoreCRUD> createState() => _FireStoreCRUDState();
}

class _FireStoreCRUDState extends State<FireStoreCRUD> {
  TextEditingController s_ID = TextEditingController();
  TextEditingController s_Roll = TextEditingController();
  TextEditingController s_Name = TextEditingController();

  var id, name, roll;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          backgroundColor: Colors.green,
          title: Text('Student Form'),
          centerTitle: true,
          elevation: 15,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Column(
                children: [
                  TextField(
                    controller: s_ID,
                    onChanged: (String id) {
                      setState(
                        () {
                          id = s_ID.text;
                        },
                      );
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        child: Text(
                          'ID',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      fillColor: Colors.black.withOpacity(0.5),
                      filled: true,
                      border: InputBorder.none,
                      hintText: 'Enter a Student ID',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusColor: Colors.green,
                      prefixIconColor: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: s_Name,
                    onChanged: (String name) {
                      setState(
                        () {
                          name = s_Name.text;
                        },
                      );
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      fillColor: Colors.black.withOpacity(0.5),
                      filled: true,
                      border: InputBorder.none,
                      hintText: 'Enter a Student Name',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusColor: Colors.green,
                      prefixIconColor: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: s_Roll,
                    onChanged: (String roll) {
                      setState(
                        () {
                          roll = s_Roll.text;
                        },
                      );
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.info),
                      fillColor: Colors.black.withOpacity(0.5),
                      filled: true,
                      border: InputBorder.none,
                      hintText: 'Enter a Student Roll Number',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusColor: Colors.green,
                      prefixIconColor: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          createData();
                        },
                        child: Text('Insert'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.amber),
                        onPressed: () {
                          loadData();
                        },
                        child: Text('Load'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () {
                          updateData();
                        },
                        child: Text('Update'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () {
                          deleteData();
                        },
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  id == null && name == null && roll == null
                      ? Container()
                      : Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('ID : $id'),
                              Text('NAME : $name'),
                              Text('ROLL NO: $roll'),
                            ],
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  createData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Students').doc(s_ID.text);

    Map<String, dynamic> data = {'ID': s_ID.text, 'NAME': s_Name.text, 'ROLL NO': s_Roll.text};

    documentReference.set(data).whenComplete(
      () {
        print('Data Inserted Successfully.');
      },
    );
  }

  loadData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Students').doc(s_ID.text);
    documentReference.get().then(
      (value) {
        setState(
          () {
            id = value.get('ID');
            name = value.get('NAME');
            roll = value.get('ROLL NO');
          },
        );
      },
    );
    print(id);
    print(name);
    print(roll);
  }

  deleteData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Students').doc(s_ID.text);

    documentReference.delete().whenComplete(
      () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data Deleted Successfully.'),
          ),
        );
      },
    );
  }

  updateData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Students').doc(s_ID.text);

    Map<String, dynamic> data = {'ID': s_ID, 'NAME': s_Name, 'ROLL NO': s_Roll};

    documentReference.update(data).whenComplete(
        () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data Update Successfully...'),
          ),
        ),
      );
  }
}
