import 'package:cloud_firestore/cloud_firestore.dart';

class PanificadoraData{
  String id;
  String nome;
  String cnpj;
  String icone;
  String latitude;
  String longetude;

  PanificadoraData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    nome =  snapshot.data["nome"];
    cnpj =  snapshot.data["cnpj"];
    icone =  snapshot.data["icone"];
    //latitude =  snapshot.data["location"]["latitude"];

  }
}