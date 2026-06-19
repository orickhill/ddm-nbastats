import 'package:flutter/material.dart';
import 'package:projeto/app/Providers/ControleFavoritos.dart';
import 'package:projeto/app/templates/BuscarDesenvolvedores.dart';
import 'package:projeto/app/templates/DetalharDesenvolvedor.dart';
import 'package:projeto/app/templates/Home.dart';
import 'package:projeto/app/templates/Login.dart';
import 'package:projeto/app/templates/MostrarAvaliacoes.dart';
import 'package:projeto/app/templates/Perfil.dart';
import 'package:projeto/app/templates/Settings.dart';
import 'package:projeto/app/templates/NavigationHub.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
        create: (c) {
          return ControleFavoritos();
        },
        child: MinhaApp(),
    ),
  );
}

class MinhaApp extends StatelessWidget{
  const MinhaApp({super.key});
  Widget build(BuildContext bc){
    //final largura = MediaQuery.of(bc).size.width;
    return MaterialApp(
      initialRoute: "/login",
      routes: {
        "/home": (c){return NavigationHub();},
        "/buscar": (c){return BuscarDesenvolvedores();},
        "/detalhes": (c){return DetalharDesenvolvedor();},
        "/settings": (c){return Settings();},
        "/login": (c){return Login();},
        "/avaliacoes": (c){return Mostraravaliacoes();},
      },
    );
  }
}