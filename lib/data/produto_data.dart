import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutoData{
  String panificadora;
  String id;
  String descricao;
  double preco;
  String unidade;
  String imagem;

  ProdutoData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    descricao =  snapshot.data["descricao"];
    preco =  snapshot.data["preco"];
    unidade =  snapshot.data["unidade"];
    imagem =  snapshot.data["imagem"];
    //latitude =  snapshot.data["location"]["latitude"];

  }
}