import 'package:ai_pede/screens/produtos_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PanificadoraTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  PanificadoraTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(snapshot.data['icone']),
          ),
          title: Text(snapshot.data['nome']),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>ProdutoScreen(snapshot))
            );
          },
        ),
      )),
    );
  }
}
