import 'package:ai_pede/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';

class MDrawer extends StatelessWidget {

  final PageController pageController;


  MDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255,239,108,0),
          Colors.orangeAccent
        ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
    );
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 25.0,
                      left: 0.0,
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.person, color: Colors.white, size: 55,),
                          Text("Marcelo Alves",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      )
                    ),
                    Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.mail, color: Colors.white,),
                            Text("marceloalvessoft@gmail.com",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.list, "Início", pageController,0),
              DrawerTile(Icons.list, "Panificadoras", pageController,1),
              DrawerTile(Icons.fastfood, "Meus Cumpons", pageController,2),
              DrawerTile(Icons.exit_to_app, "Sair", pageController,3),

            ],
          )
        ],
      ),
    );
  }
}
