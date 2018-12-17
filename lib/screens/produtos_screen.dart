import 'package:ai_pede/tiles/cart_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ai_pede/tiles/produtogrid_tile.dart';
import 'package:ai_pede/tiles/produtolist_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<DocumentSnapshot> carrinho = [];

class ProdutoScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;
  ProdutoScreen(this.snapshot);

 Future getCarrinho() async {
    final  prefs = await  SharedPreferences.getInstance();
    List<String> lista =  prefs.getStringList("flutter.carrinho") ?? [];
    lista.forEach((id) async {
       DocumentSnapshot documentSnapshot = await snapshot.reference.collection("produtos").document(id).get();
       carrinho.add(documentSnapshot);
    });
    return carrinho;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.shopping_basket)),
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
                      snapshot.reference.collection("produtos").getDocuments(),
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
                                return ProdutoTileGrid(doc);
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
              child: FutureBuilder<QuerySnapshot>(
                  future:
                      snapshot.reference.collection("produtos").getDocuments(),
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
                                return ProdutoTileList(doc);
                              }),
                              color: Colors.transparent)
                          .toList();
                      return ListView(
                        children: dividedTiles,
                      );
                    }
                  }),
            ),
            Container(
              color: Colors.orange,
              child: FutureBuilder<dynamic>(
                  future: getCarrinho(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.deepOrange,
                        ),
                      );
                    } else {
                      return ListView(
                        children: ListTile.divideTiles(
                            tiles: carrinho.map(doc) {
                              return ProdutoTileList(doc);
                            }).toList(),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
