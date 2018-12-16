import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ai_pede/tiles/produto_tile.dart';

class ProdutoScreen extends StatelessWidget {

  final DocumentSnapshot snapshot;


  ProdutoScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.list)),
            ],
          ),
          title: Text(snapshot.data['nome']),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.orange,
              child: FutureBuilder<QuerySnapshot>(
                future:
                    Firestore.instance.collection("produtos")
                    .where("panificadora", isEqualTo: snapshot.documentID)
                    .getDocuments(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.deepOrange,
                      ),
                    );
                  } else {
                    var dividedTiles = ListTile.divideTiles(
                      tiles: snapshot.data.documents.map((doc) {
                        return ProdutoTile(doc);
                      }),
                      color: Colors.transparent)
                      .toList();
                    return GridView.count(
                      crossAxisCount: 2,
                      children: dividedTiles,
                    );
                  }
                }),
            ),
            Container(
              color: Colors.orange,
              child: Text("List"),
            ),
          ],
        ),
      ),
    );
  }
}
