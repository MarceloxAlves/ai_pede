import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

class AutoComplete extends StatefulWidget {
  @override
  _AutoCompleteState createState() => new _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoComplete> {
  List<String> added = [];
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

  _AutoCompleteState() {
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

  List<String> suggestions = [
    "Apple",
    "Armidillo",
    "Actual",
    "Actuary",
    "America",
    "Argentina",
    "Australia",
    "Antarctica",
    "Blueberry",
    "Cheese",
    "Danish",
    "Eclair",
    "Fudge",
    "Granola",
    "Hazelnut",
    "Ice Cream",
    "Jely",
    "Kiwi Fruit",
    "Lamb",
    "Macadamia",
    "Nachos",
    "Oatmeal",
    "Palm Oil",
    "Quail",
    "Rabbit",
    "Salad",
    "T-Bone Steak",
    "Urid Dal",
    "Vanilla",
    "Waffles",
    "Yam",
    "Zest"
  ];

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
