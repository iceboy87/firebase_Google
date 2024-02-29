import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class home extends StatefulWidget {
  const home({super.key});


  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Home Page"),
      ),
      body: GestureDetector(
        onTap: ()async{
          await _googleSignIn.signOut();
        },
        child: Container(
          child: Text("SignOut"),
        ),
      )

    );
  }
}
