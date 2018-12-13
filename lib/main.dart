import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  Firestore.instance
      .collection("deu")
      .document("jumentos")
      .setData({"nome": "Daniel"});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Connected',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Meu pau no teu cu'),
        ),
        body: Center(
          child: Text('Vai dar certo'),
        ),
      ),
    );
  }
}
