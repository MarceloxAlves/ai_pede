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

Future<Null> _login() async {
  GoogleSignInAccount user = googleSignIn.currentUser;
  if (user == null) user = await googleSignIn.signInSilently();
  if (user == null) user = await googleSignIn.signIn();
  if (await auth.currentUser() == null) {
    GoogleSignInAuthentication credecials =
        await user.authentication;
    await auth.signInWithGoogle(
        idToken: credecials.idToken, accessToken: credecials.accessToken);
  }
  assert(user == null);
}

//AIzaSyBCt4rwnHmE_nQ-FliUURvGuyaDB6ZWESQ

_teste() async {
  await _login();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _teste();
    return MaterialApp(
      title: 'Ai Pede',
      debugShowCheckedModeBanner: false,
      theme: themeDefault,
      home: HomeSreen(),
    );
  }
}