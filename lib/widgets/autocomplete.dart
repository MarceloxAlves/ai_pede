import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FirstPage extends StatefulWidget {
  List<DocumentSnapshot> _querySnapshot;
  GoogleMapController controller;

  FirstPage(this._querySnapshot, this.controller);

  @override
  _FirstPageState createState() =>
      new _FirstPageState(this._querySnapshot, controller);
}

class _FirstPageState extends State<FirstPage> {
  List<String> added = [];
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  List<DocumentSnapshot> querySnapshot;
  GoogleMapController controller;
  List<String> suggestions = [];

  _FirstPageState(this.querySnapshot, this.controller) {
    this.querySnapshot.forEach((doc) {
      suggestions.add(doc.data["nome"].toString());
    });

    textField = SimpleAutoCompleteTextField(
      key: key,
      suggestions: suggestions,
      textChanged: (text) => currentText = text,
      textSubmitted: (text) => setState(() {
            added.add(text);
          }),
    );
  }

  SimpleAutoCompleteTextField textField;

  @override
  Widget build(BuildContext context) {
    Column body = new Column(children: [
      new ListTile(
          title: textField,
          trailing: new IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {
                setState(() {
                  if (currentText != "") {
                    added.add(currentText);
                    textField.clear();
                    currentText = "";
                  }
                });
              }))
    ]);

    body.children.addAll(added.map((item) {
      return new ListTile(title: new Text(item));
    }));

    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.topCenter,
      width: 400,
      height: 75,
      child: new Scaffold(resizeToAvoidBottomPadding: false, body: body),
    );
  }
}
