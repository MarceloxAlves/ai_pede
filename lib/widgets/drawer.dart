import 'package:ai_pede/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 16),
                child: FutureBuilder<FirebaseUser>(
                    future: FirebaseAuth.instance.currentUser(),
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      if(!snapshot.hasData){
                        return Center(child: Text("Usuario deslogado",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white
                            ),
                          )
                        );
                      }
                      return ListBody(
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.white,
                                  backgroundImage:NetworkImage(snapshot.data.photoUrl)
                              ),
                            ),
                          ),
                          Text(snapshot.data.displayName,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Icon(Icons.mail, color: Colors.white,),
                                ),
                                Text(snapshot.data.email,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                ),
              ),
              Divider(),
              Container(
                child: ListBody(
                  children: <Widget> [
                  DrawerTile(Icons.home, "Início", pageController,0,),
                  DrawerTile(Icons.fastfood, "Panificadoras", pageController,1),
                  DrawerTile(Icons.shopping_cart, "Meu Carrinho", pageController,2),
                  DrawerTile(Icons.local_offer, "Meus Cupons", pageController,3),
                  DrawerTile(Icons.exit_to_app, "Sair", pageController,4),
                ]
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
