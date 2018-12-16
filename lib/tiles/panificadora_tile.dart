import 'package:ai_pede/screens/produtos_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PanificadoraTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  PanificadoraTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 3, left: 3, right: 3),
      elevation: 1,
      child: Material(
        color: Colors.orange,
        shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(4)
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>ProdutoScreen(snapshot))
            );
          },
          highlightColor: Colors.orangeAccent[100],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(snapshot.data['icone']),
              ),
              title: Text(snapshot.data['nome'],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white,),

            ),
          ),
        ),
      ),
    );
  }
}
