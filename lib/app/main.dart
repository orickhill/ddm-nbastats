import 'package:flutter/material.dart';
import 'package:projeto/app/Providers/ControleFavoritos.dart';
import 'package:projeto/app/Views/BuscarDesenvolvedores.dart';
import 'package:projeto/app/Views/Cadastrar.dart';
import 'package:projeto/app/Views/DetalharDesenvolvedor.dart';
import 'package:projeto/app/Views/Login.dart';
import 'package:projeto/app/Views/MostrarAvaliacoes.dart';
import 'package:projeto/app/Views/Perfil.dart';
import 'package:projeto/app/Views/Settings.dart';
import 'package:projeto/app/Views/NavigationHub.dart';
import 'package:projeto/app/Views/Splash.dart';
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

  @override
  Widget build(BuildContext bc){
    return MaterialApp(
      initialRoute: "/splash",
      routes: {
        "/home": (c){return NavigationHub();},
        "/buscar": (c){return BuscarDesenvolvedores();},
        "/detalhes": (c){return DetalharDesenvolvedor();},
        "/settings": (c){return Settings();},
        "/login": (c){return Login();},
        "/avaliacoes": (c){return Mostraravaliacoes();},
        "/splash": (c){return Splash();},
        "/cadastrar": (c){return Cadastrar();}
      },
    );
  }
}