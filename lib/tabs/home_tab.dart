import 'package:flutter/material.dart';
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildHomeBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 237,121,3),
            Color.fromARGB(255, 243,148,0),
          ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          )
      ),
    );

    return Stack(
      children: <Widget>[
        _buildHomeBack(),

      ],
    );

  }
}

