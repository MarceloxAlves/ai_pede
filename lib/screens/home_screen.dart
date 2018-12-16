import 'package:ai_pede/tabs/home_tab.dart';
import 'package:ai_pede/tabs/panificadoras_tab.dart';
import 'package:ai_pede/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomeSreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          appBar: AppBar(
            title: Text('Aí Pede'),
            elevation: 0.1,
          ),
          drawer: MDrawer(_pageController),
        ),
        Scaffold(
          body: PanificadorasTab(),
          appBar: AppBar(
            title: Text('Panificadoras'),
            elevation: 0.1,
          ),
          drawer: MDrawer(_pageController),
        ),
      ],
    );
  }
}
