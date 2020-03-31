import 'package:flutter/material.dart';
import 'loginpage.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    
    return new MaterialApp(
      title: 'flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: new LoginPage()
    );
  }


}