import 'package:flutter/material.dart';

class sign extends StatefulWidget {
  const sign({super.key});

  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Account"),
      ),
      body: Container(
        height: 300,
        width: 380,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),

        ),
        child: Column(
          children: [
            TextFormField(),
            TextFormField(),
            ElevatedButton(onPressed: (){}, child: Text("Sign"))
          ],
        ),
      ),

    );
  }
}
