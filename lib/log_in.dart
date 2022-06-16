import 'package:database/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String _mail = '';
  String _pass = '';
  var _phone = TextEditingController();
  var _otp = TextEditingController();
  String? verificationID;

  var _key = GlobalKey<FormState>();
  var _scaffoldkey = GlobalKey<ScaffoldState>();
  var show = true;
  User? user;

  checkStatus(usercred) async {
    setState(
      () {
        user = usercred;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    checkStatus(FirebaseAuth.instance.currentUser);
    if (user != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (mail) {
                      if (mail!.isEmpty) {
                        return 'Email is Required.';
                      }
                      if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z.-]+.[a-zA-Z]')
                          .hasMatch(mail)) {
                        return 'Enter a Valid Email.';
                      }
                    },
                    onSaved: (input) => _mail = input!,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      hintText: 'Enter a Email',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.3),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (pass) {
                      if (pass!.isEmpty) {
                        return 'Password is Required.';
                      }
                      if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(pass)) {
                        return 'Enter A Valid Password.';
                      }
                    },
                    obscureText: show,
                    obscuringCharacter: '*',
                    onSaved: (input) => _pass = input!,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      hintText: 'Enter a Password',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.3),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              show = !show;
                            },
                          );
                        },
                        child: Icon(
                          show == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _login();
                        },
                        style:
                            ElevatedButton.styleFrom(primary: Colors.redAccent),
                        child: Text('Log IN'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _signup();
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        child: Text('Sign Up'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // TextFormField(
                  //   validator: (phone) {
                  //     if (phone!.isEmpty) {
                  //       return 'Email is Required.';
                  //     }
                  //   },
                  //   controller: _phone,
                  //   decoration: InputDecoration(
                  //     prefixIcon: Icon(Icons.call),
                  //     hintText: 'Enter a Mobile Number',
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide.none,
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide.none,
                  //     ),
                  //     errorBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide.none,
                  //     ),
                  //     border: InputBorder.none,
                  //     filled: true,
                  //     fillColor: Colors.black.withOpacity(0.3),
                  //   ),
                  // ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: _phone.text,
                        verificationCompleted: (phoneCred) async {},
                        verificationFailed: (verificationFailed) async {
                          _scaffoldkey.currentState!.showSnackBar(
                            SnackBar(
                              content: Text(verificationFailed.message!),
                            ),
                          );
                        },
                        codeSent: (verificationId, resendingToken) async {
                          setState(
                            () {
                              this.verificationID = verificationID!;
                            },
                          );
                        },
                        codeAutoRetrievalTimeout: (verificationID) async {},
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: Text('Send'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _signup() async {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _mail,
        password: _pass,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  _login() async {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
    }

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _mail, password: _pass);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
