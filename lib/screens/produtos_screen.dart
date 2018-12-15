import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
            new RaisedButton(
              elevation: 1.5,
              onPressed: (){},
              textColor: Colors.white,
              color: Colors.orangeAccent,
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Clique aqui para adicionar um pão automatico",
              ),
            ),
            Text('Cardápio'),
          ],
        ),
      ),
    );
  }
}
