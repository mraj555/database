import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GSignIn extends StatefulWidget {
  const GSignIn({Key? key}) : super(key: key);

  @override
  State<GSignIn> createState() => _GSignInState();
}

class _GSignInState extends State<GSignIn> {
  GoogleSignIn googleSignIn = GoogleSignIn();
  bool _signIn = false;

  @override
  Widget build(BuildContext context) {
    print('isCheck = $_signIn');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Google Sign In'),
          centerTitle: true,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
          backgroundColor: Colors.black,
        ),
        body: _signIn == true
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          googleSignIn.currentUser!.photoUrl.toString()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Name : ${googleSignIn.currentUser!.displayName}'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Email : ${googleSignIn.currentUser!.email}'),
                    SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        signOut();
                      },
                      child: Text('Sign Out'),
                    ),
                  ],
                ),
              )
            : Center(
                child: OutlinedButton(
                  onPressed: () {
                    signIn();
                  },
                  child: Text('Sign IN'),
                ),
              ),
      ),
    );
  }

  signIn() async {
    try {
      var user = await googleSignIn.signIn();
      var auth = await user!.authentication;
      var cred = GoogleAuthProvider.credential(
          idToken: auth.idToken, accessToken: auth.accessToken);
      await FirebaseAuth.instance.signInWithCredential(cred);
      setState(() {
        _signIn = true;
      });
    } catch (e) {
      print(e);
    }
  }

  signOut() async {
    await googleSignIn.signOut();
    setState(() {
      _signIn = false;
    });
  }
}
