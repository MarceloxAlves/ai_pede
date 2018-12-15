import 'package:flutter/material.dart';

class TextNav extends StatelessWidget {
  final double page;

  TextNav(this.page);

  @override
  Widget build(BuildContext context) {
    switch(page.round()) {
      case 0: {
        return Text('Panificadoras');
      }
      break;

      case 1: {
        return Text('Aí pede');
      }
      break;

      default: {
        return Text('Aí pede');
      }
      break;
    }
  }
}
