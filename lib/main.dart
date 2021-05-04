import 'package:flutter/material.dart';
import 'package:login_stateful/src/screens/login_screen.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
