import 'package:flutter/material.dart';
import 'package:login_signin/auth.dart';
import 'loginpage.dart';
import 'auth.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'flutter',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new LoginPage(auth: new Auth())); 
  }
} //hey
