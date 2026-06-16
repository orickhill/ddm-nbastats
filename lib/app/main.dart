import 'package:flutter/material.dart';
import 'package:projeto/app/templates/BuscarDesenvolvedores.dart';
import 'package:projeto/app/templates/DetalharDesenvolvedor.dart';
import 'package:projeto/app/templates/Home.dart';
import 'package:projeto/app/templates/Login.dart';

void main(){
  runApp(MinhaApp());
}

class MinhaApp extends StatelessWidget{
  final List<Jogador> jogadores = <Jogador>[
    Jogador(0, 'images/jogadores/santos.png', "Gui Santos", 15, true),
    Jogador(1, 'images/jogadores/green.png', "Draymond Green", 23, true),
    Jogador(2, 'images/jogadores/horford.jpg', "Al Horford", 20, false),
    Jogador(3, 'images/jogadores/curry.png', "Stephen Curry", 30, true),
    Jogador(4, 'images/jogadores/melton.jpg', "De'Anthony Melton", 8, false),
    Jogador(5, 'images/jogadores/podziemsk.jpg', "Brandin Podziemski", 2, false),
    Jogador(6, 'images/jogadores/santos.png', "Gui Santos", 15, true),
    Jogador(7, 'images/jogadores/green.png', "Draymond Green", 23, true),
    Jogador(8, 'images/jogadores/horford.jpg', "Al Horford", 20, false),
    Jogador(9, 'images/jogadores/curry.png', "Stephen Curry", 30, true),
    Jogador(10, 'images/jogadores/melton.jpg', "De'Anthony Melton", 8, false),
    Jogador(11, 'images/jogadores/podziemsk.jpg', "Brandin Podziemski", 2, false),
  ];
  Widget build(BuildContext bc){
    final largura = MediaQuery.of(bc).size.width;
    return MaterialApp(
      initialRoute: "/login",
      routes: {
        "/": (c){return Home();},
        "/buscar": (c){return Buscardesenvolvedores();},
        "/detalhes": (c){return DetalharDesenvolvedor();},
        "/login": (c){return Login();},
      },
    );
  }
}

class Jogador {
  int id;
  String image;
  String nome;
  int numero;
  bool favorito;
  Jogador(this.id, this.image, this.nome, this.numero, this.favorito);
}