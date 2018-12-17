import 'package:ai_pede/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final ThemeData themeDefault = ThemeData(
    primarySwatch: Colors.deepOrange, accentColor: Colors.orangeAccent);


//AIzaSyBCt4rwnHmE_nQ-FliUURvGuyaDB6ZWESQ

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    _teste();
    return MaterialApp(
      title: 'Ai Pede',
      debugShowCheckedModeBanner: false,
      theme: themeDefault,
      home: LoginPage(),
    );
  }
}