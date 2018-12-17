
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CarrinhoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildHomeBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 237, 121, 3),
            Color.fromARGB(255, 243, 148, 0),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
    );


    return Stack(
      children: <Widget>[_buildHomeBack(),
      FutureBuilder<FirebaseUser>(
          future: FirebaseAuth.instance.currentUser(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.deepOrange,
                ),
              );
            } else {
              return FutureBuilder<QuerySnapshot>(
                future: Firestore.instance.collection("carrinhos")
                    .where("user_id", isEqualTo: snapshot.data.uid)
                    .where("finalizado", isEqualTo: false)
                    .getDocuments(),

                builder: (context, snapshotCarrinho) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.deepOrange,
                      ),
                    );
                  } else {
                    var dividedTiles = ListTile.divideTiles(
                        tiles: snapshotCarrinho.data.documents.map((doc) {
                          return Text(doc.documentID);
                        }),
                        color: Colors.transparent)
                        .toList();
                    return ListView(
                      children: dividedTiles,
                    );
                  }
                },
              );
            }
          }),
      ],
    );
  }
}