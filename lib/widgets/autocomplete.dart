import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AutoComplete extends StatefulWidget {
  List<DocumentSnapshot> _querySnapshot;
  GoogleMapController controller;

  AutoComplete(this._querySnapshot, this.controller);

  @override
  _AutoCompleteState createState() => new _AutoCompleteState(this._querySnapshot, controller);
}

class _AutoCompleteState extends State<AutoComplete> {
  List<String> added = [];
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  List<DocumentSnapshot> querySnapshot;
  GoogleMapController controller;
  List<String> suggestions = [];

  _AutoCompleteState(this.querySnapshot, this.controller) {
    this.querySnapshot.forEach((doc) {
      suggestions.add(doc.data["nome"].toString());
    });

    textField = SimpleAutoCompleteTextField(
      key: key,
      suggestions: suggestions,
      style: TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
        ),
        hintText: 'Pesquisar...'
      ),
      textChanged: (text) => currentText = text,
      textSubmitted: (text) => setState(() {
            added.add(text);
          }),
    );
  }

  SimpleAutoCompleteTextField textField;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(8),
          color: Colors.black12,
          child: Column(children: [
          new ListTile(
              title: textField,
              trailing: new IconButton(
                  icon: new Icon(Icons.search, color: Colors.white,),
                  splashColor: Colors.white54,
                  highlightColor: Colors.white54,
                  onPressed: () {
                    setState(() {
                      if (currentText != "") {
                        added.add(currentText);
                        textField.clear();
                        currentText = "";
                      }
                    });
                  }))
        ]))
      ],
    );
  }
}
