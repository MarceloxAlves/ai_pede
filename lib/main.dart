import 'package:ai_pede/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

final ThemeData themeDefault = ThemeData(
    primarySwatch: Colors.deepOrange, accentColor: Colors.orangeAccent);

final googleSignIn = GoogleSignIn();
final auth = FirebaseAuth.instance;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ai Pede',
      debugShowCheckedModeBanner: false,
      theme: themeDefault,
      home: HomeSreen(),
    );
  }
}