import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        await googleSignIn.currentUser.authentication;
    await auth.signInWithGoogle(
        idToken: credecials.idToken, accessToken: credecials.accessToken);
  }
}

_teste() async {
  await _login();
  Firestore.instance
      .collection("paes")
      .add({"nome": "Pão Francês", "preco": 13.50, "min": 2});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ai Pede',
      debugShowCheckedModeBanner: false,
      theme: themeDefault,
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.location_on)),
              Tab(icon: Icon(Icons.restaurant)),
              Tab(icon: Icon(Icons.fastfood)),
            ],
          ),
          title: Text('Aí Pede'),
        ),
        body: TabBarView(
          children: [
            new RaisedButton(
              elevation: 1.5,
              onPressed: _teste,
              textColor: Colors.white,
              color: Colors.orangeAccent,
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Clique aqui para adicionar um pão automatico",
              ),
            ),
            Text('Cardápio'),
            Text('Alguma coisa'),
          ],
        ),
      ),
    );
  }
}
