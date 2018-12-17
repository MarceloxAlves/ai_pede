import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProdutoTileGrid extends StatelessWidget {
  final DocumentSnapshot snapshot;

  ProdutoTileGrid(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(2),
      elevation: 1,
      child: Material(
        color: Colors.white,
        shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(4)
        ),
        child: InkWell(
          onTap: (){},
          highlightColor: Colors.orangeAccent[100],
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(snapshot.data["image"]),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget> [
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(snapshot.data["descricao"],
                                style: TextStyle(
                                  fontSize: 18,
                                  )
                              ),
                              Text("R\$ " + snapshot.data["preco"].toString(),
                                style: TextStyle(
                                  fontSize: 24,
                                  )
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.shopping_cart, color: Colors.black,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: ListTile(
          //     leading: CircleAvatar(
          //       radius: 25.0,
          //       backgroundColor: Colors.white,
          //       backgroundImage: NetworkImage(snapshot.data['imagem']),
          //     ),
          //     title: Text(snapshot.data['nome']),
          //     trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black,),
          //   ),
          // ),
        ),
      ),
    );
  }
}
