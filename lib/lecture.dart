import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Lecture extends StatefulWidget {
  const Lecture({Key? key}) : super(key: key);

  @override
  State<Lecture> createState() => _LectureState();
}

class _LectureState extends State<Lecture> {
  bool isSignIn = false;
  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Bar'),
      ),
      body: isSignIn
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    googleSignIn.currentUser!.photoUrl.toString(),
                    height: 200,
                    width: 200,
                  ),
                  Text(googleSignIn.currentUser!.displayName.toString()),
                  Text(googleSignIn.currentUser!.email.toString()),
                  OutlinedButton(
                    onPressed: () {
                      singOut();
                    },
                    child: Text('LogOut'),
                  ),
                ],
              ),
            )
          : Center(
              child: OutlinedButton(
                child: Text('Login with Google'),
                onPressed: () {
                  signIn();
                },
              ),
            ),
    );
  }

  signIn() async {
    try {
      await googleSignIn.signIn();
      setState(() {
        isSignIn = true;
      });
    } catch (e) {
      print(e);
    }
  }

  singOut() {
    googleSignIn.signOut();
    setState(() {
      isSignIn = false;
    });
  }
}
