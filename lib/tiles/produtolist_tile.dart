import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProdutoTileList extends StatelessWidget {
  final DocumentSnapshot snapshot;

  ProdutoTileList(this.snapshot);

  @override
  Widget build(BuildContext context) {
    SharedPreferences.setMockInitialValues({
      "flutter.carrinho": []
    });
    return Card(
      margin: EdgeInsets.only(top: 3, left: 3, right: 3),
      elevation: 1,
      child: Material(
        color: Colors.white,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(4)),
        child: InkWell(
          onTap: () {},
          highlightColor: Colors.orangeAccent[100],
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(snapshot.data['image']),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    snapshot.data['descricao'],
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "R\$ " + snapshot.data['preco'].toString(),
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              trailing: InkWell(
                child: Icon(Icons.shopping_basket, color: Colors.black),
                onTap: () async {
                    final  prefs = await  SharedPreferences.getInstance();

                    List<String> lista =  prefs.getStringList("flutter.carrinho") ?? [];
                    lista.add(snapshot.documentID);
                    await prefs.setStringList("flutter.carrinho",lista);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
