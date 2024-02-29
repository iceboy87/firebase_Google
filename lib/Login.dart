import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Home.dart';
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final GoogleSignIn _googleSignIn = GoogleSignIn(clientId: "47117773124-1hitkcflfoq926avup4u14ifock0le7t.apps.googleusercontent.com");
  Future<UserCredential?>signInWithGoogle() async {
    await _googleSignIn.signOut();
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    final OAuthCredential credential =GoogleAuthProvider.credential(accessToken: googleSignInAuthentication.accessToken,idToken: googleSignInAuthentication.idToken );
    final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user!.displayName);
    print(userCredential.user!.email);
    print(userCredential.user!.metadata);
    Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login Page",style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
      body: Center(
        child: GestureDetector(
          onTap: signInWithGoogle,
          child :Container(
            height: 80,
            width: 300,
            child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                  width: 60,
                  child: Image(image: AssetImage("assets/Google.png",))),
              SizedBox(width: 8,),
              Text("Google Login")
            ],
          )
        ),
      ))
    );
  }
}
