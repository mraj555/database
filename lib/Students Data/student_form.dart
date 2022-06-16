import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database/Students%20Data/students_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({Key? key}) : super(key: key);

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  var stud_id = TextEditingController();
  var stud_name = TextEditingController();
  var mobile_number = TextEditingController();
  var email_add = TextEditingController();
  var gender = TextEditingController();
  var password = TextEditingController();

  List<FocusNode> focusNode = List.generate(5, (index) => FocusNode());

  var _key = GlobalKey<FormState>();

  bool show = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Student Form'),
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 8, right: 8.0),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    _field(
                      focus: focusNode[0],
                      icon: Icons.info,
                      controller: stud_id,
                      type: TextInputType.number,
                      hint: 'Enter A Student ID',
                      lab: 'ID',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _field(
                      focus: focusNode[1],
                      icon: Icons.account_circle,
                      controller: stud_name,
                      type: TextInputType.name,
                      hint: 'Enter A Student Name',
                      lab: 'Name',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _field(
                      focus: focusNode[2],
                      icon: Icons.call,
                      controller: mobile_number,
                      length: 10,
                      type: TextInputType.phone,
                      hint: 'Enter A Mobile Number',
                      lab: 'Mobile No.',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _field(
                      focus: focusNode[3],
                      icon: Icons.email,
                      controller: email_add,
                      type: TextInputType.emailAddress,
                      hint: 'Enter A Email Address',
                      lab: 'Email',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _field(
                      focus: focusNode[4],
                      icon: Icons.password,
                      controller: password,
                      type: TextInputType.visiblePassword,
                      hint: 'Enter A Password',
                      lab: 'Password',
                      show: !show,
                      pass: GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              show = !show;
                            },
                          );
                        },
                        child: Icon(
                          show == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: focusNode[4].hasFocus
                              ? Colors.green
                              : Colors.grey,
                        ),
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
                            if (_key.currentState!.validate()) {
                              createData();
                              stud_id.clear();
                              stud_name.clear();
                              mobile_number.clear();
                              email_add.clear();
                              password.clear();
                              focusNode[0].requestFocus();
                            }
                          },
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          child: Text('Insert'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showData();
                          },
                          child: Text('Show Data'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _field({
    required IconData icon,
    GestureDetector? pass,
    String? lab,
    String? hint,
    bool show = false,
    required TextEditingController controller,
    TextInputType? type,
    int? length,
    bool read = false,
    required FocusNode focus,
  }) {
    return TextFormField(
      obscureText: show,
      obscuringCharacter: '*',
      controller: controller,
      keyboardType: type,
      maxLength: length,
      readOnly: read,
      focusNode: focus,
      validator: (val) {
        if (val!.isEmpty) {
          return '$lab is Required.';
        }
        if (lab == 'Email') {
          if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z.-]+.[a-z]').hasMatch(val)) {
            return 'Enter a Valid Email.';
          }
        }
        if (lab == 'Password') {
          if (!RegExp(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
              .hasMatch(val)) {
            return 'Enter a Valid Password.';
          }
        }
        if (lab == 'Mobile No.') {
          if (val.characters.length > 10 || val.characters.length < 10) {
            return 'Mobile No. Must Be 10 Digits.';
          }
        }
      },
      onChanged: (val) {
        setState(
          () {
            val = controller.text;
          },
        );
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.green),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        prefixIcon: Icon(
          icon,
          color: focus.hasFocus ? Colors.green : Colors.grey,
        ),
        suffixIcon: pass,
        border: InputBorder.none,
        floatingLabelStyle: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hint!,
        labelText: lab!,
      ),
    );
  }

  createData() {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Students Data')
        .doc(stud_id.text);

    Map<String, dynamic> data = {
      'ID': stud_id.text,
      'NAME': stud_name.text,
      'MOBILE NO': mobile_number.text,
      'EMAIL': email_add.text,
      'PASSWORD': password.text,
    };

    documentReference.set(data).whenComplete(
          () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Data Created Successfully.'),
            ),
          ),
        );
  }

  showData() {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('Students Data');

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => StudentsData(studentdata: collectionReference),
      ),
    );
  }
}
