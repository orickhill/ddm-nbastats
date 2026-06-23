import 'package:flutter/material.dart';
import 'package:projeto/app/Views/BuscarDesenvolvedores.dart';
import 'package:projeto/app/Views/DetalharDesenvolvedor.dart';
import 'package:projeto/app/Views/Home.dart';
import 'package:projeto/app/Views/Login.dart';
import 'package:projeto/app/Views/Perfil.dart';
import 'package:projeto/app/Views/Settings.dart';

class NavigationHub extends StatelessWidget{
  final ValueNotifier<int> _indicePai = ValueNotifier<int>(0);

  final List<Widget> _telas = [
    Home(),
    BuscarDesenvolvedores(),
    Perfil(),
  ];
  Widget build(BuildContext bc){
    //final largura = MediaQuery.of(bc).size.width;
    return ValueListenableBuilder<int>(
        valueListenable: _indicePai,
        builder: (bc, valorAtual, child) {
          return Scaffold(
            appBar: AppBar(
              actionsPadding: EdgeInsets.all(15),
              iconTheme: IconThemeData(color: Colors.white, size: 40),
              backgroundColor: const Color(0xFF682EA3),
              title: Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: Builder(builder: (BuildContext nc){
                    return IconButton(
                        onPressed: () {
                          print("notificações");
                          final snackBar = SnackBar(
                            content: const Center(child: Text("Nada para mostrar"),),
                            duration: const Duration(milliseconds: 2500),
                            width: 200.0,
                            behavior: SnackBarBehavior.floating,
                          );
                          ScaffoldMessenger.of(nc).showSnackBar(snackBar);
                        },
                        icon: Icon(Icons.notifications_none, color: Colors.white, size: 40)
                    );
                  })
              ),
            ),
            body: IndexedStack(
              index: valorAtual,
              children: _telas,
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                      child: Text("Menu")
                  ),
                  ListTile(
                    leading: Icon(Icons.settings,),
                    title: Text("Configurações"),
                    onTap: (){
                      Navigator.pop(bc); // fecha o Drawer
                      Navigator.pushNamed(bc, "/settings");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info_outline,),
                    title: Text("Sobre"),
                    onTap: (){
                      print("Sobre");

                      showDialog(context: bc, builder: (context) => AlertDialog(
                        title: Text("Sobre o App"),
                        content: Text("Desenvolvido para a disciplina de Mobile."),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Fechar', style: TextStyle(color: Colors.red),),
                          ),
                        ],
                      ));
                    },),
                  ListTile(
                    leading: Icon(Icons.exit_to_app, color: Colors.red,),
                    title: Text("Logout"),
                    onTap: (){
                      Navigator.of(bc).pushReplacement(MaterialPageRoute(builder: (bc) => Login()));
                    },
                  ),

                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: valorAtual,
              onTap: (novoIndice) => _indicePai.value = novoIndice,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
              ],
            ),
          );
        }
    );
  }
}