import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProdutoTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  ProdutoTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                        image: NetworkImage(snapshot.data["imagem"]),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(snapshot.data["nome"], 
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text("R\$ " + snapshot.data["preco"].toString(), 
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          )
                      ),
                    ),
                  ],
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
