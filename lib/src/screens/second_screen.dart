import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  String email;
  SecondScreen ({required this.email});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Second Screen"),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop(["success","fail"]);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(16),
            ),
            child: Text("Go back ${email.substring(0,email.indexOf('@'))}"),
          ),
        ),
      ),
    );
  }
}
