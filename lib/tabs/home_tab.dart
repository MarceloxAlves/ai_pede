import 'package:ai_pede/widgets/map_panificadoras.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildHomeBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 237, 121, 3),
            Color.fromARGB(255, 243, 148, 0),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        );

//    MapView.setApiKey("AIzaSyBCt4rwnHmE_nQ-FliUURvGuyaDB6ZWESQ");

    return Stack(
      children: <Widget>[_buildHomeBack(),
      FutureBuilder<QuerySnapshot>(
          future: Firestore.instance.collection("panificadoras").getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.deepOrange,
                ),
              );
            } else {
              return InkWell(
                child:  MapsPanificadoras(snapshot.data.documents.toList()),
              );
            }
          }),

      ],
    );
  }
}
