import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main(){
  runApp(MinhaWidget());
}

class MinhaWidget extends StatelessWidget{
  MinhaWidget({super.key});
  final List<Jogador> jogadores = <Jogador>[
    Jogador(0, '/images/jogadores/santos.png', "Gui Santos", 15, true),
    Jogador(1, '/images/jogadores/green.png', "Draymond Gren", 23, true),
    Jogador(2, '/images/jogadores/horford.jpg', "Al Horford", 20, false),
    Jogador(3, '/images/jogadores/curry.png', "Stephen Curry", 30, true),
    Jogador(4, '/images/jogadores/melton.jpg', "De'Anthony Melton", 8, false),
    Jogador(5, '/images/jogadores/podziemsk.jpg', "Brandin Podziemski", 2, false),
  ];

  @override
  Widget build(BuildContext bc){
    return MaterialApp(
        title: "home",
        home: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: (){
                        print("Voltar para a home");
                      },
                    ),
                    Text("Voltar", style: TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
                Row(
                  children: [
                    Text("Favoritar", style: TextStyle(color: Colors.white, fontSize: 16)),
                    IconButton(
                      icon: const Icon(Icons.star_border),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: (){
                        print("Nada para mostrar");
                      },
                    ),
                  ],
                )
              ],
            ),
              backgroundColor: Color(0xFF17408B),
          ),
          body: Column(
            children: [
              Image.asset(
                  '/images/banner_warriors.jpg',
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Golden State Warriors (GSW)", style: TextStyle(color: Color(0xFF323232), fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Conferência: Oeste", style: TextStyle(color: Color(0xFF17408B), fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Divisão: Pacífico", style: TextStyle(color: Color(0xFF17408B), fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Cidade: San Francisco", style: TextStyle(color: Color(0xFF17408B), fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Pesquisar jogadores", style: TextStyle(color: Color(0xFF323232), fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          Stack(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Pesquisar jogador...",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.search),
                                  color: Color(0xFF323232),
                                  iconSize: 30,
                                  onPressed: (){
                                    print("Pesquisando...");
                                  },
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 3,
                              //shrinkWrap: true,
                              padding: EdgeInsets.all(8),
                              itemBuilder: (bc, i){
                                return Container(
                                  height: 100,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: Image.asset(jogadores[i].image),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 12),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(jogadores[i].nome),
                                              Text(jogadores[i].numero.toString()),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child:Center(
                                            child: IconButton(
                                              onPressed: (){},
                                              icon: Icon(jogadores[i].favorito ? Icons.favorite : Icons.favorite_border),
                                            ),
                                          ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}

// Classe Jogador()
class Jogador {
  int id;
  String image;
  String nome;
  int numero;
  bool favorito;

  Jogador(this.id, this.image, this.nome, this.numero, this.favorito);
}