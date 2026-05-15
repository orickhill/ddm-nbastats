import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    String pesquisa = "";
    final snackBar = SnackBar(
      content: const Text('Awesome SnackBar!'),
      duration: const Duration(milliseconds: 1500),
      width: 280.0, // Width of the SnackBar...
      behavior: SnackBarBehavior.floating,
    );
    return MaterialApp(
        title: "Home",
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF17408B),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => print("Voltando"),
                      icon: Icon(Icons.arrow_back, color: Colors.white, size: 40),
                  ),
                  IconButton(
                      onPressed: () => print("notificações"),
                      icon: Icon(Icons.notifications_none, color: Colors.white, size: 40)
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Text("Pesquisar jogadores", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text("Pesquisar jogadores", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  TextField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]"))],
                    keyboardType: TextInputType.text,
                    onChanged: (texto) => pesquisa = texto, // alimentando a variável de pesquisa
                    decoration: InputDecoration(
                      hintText: "Pesquisar jogador...",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          if(pesquisa.length >= 3)
                            print("Pesquisando por: " + pesquisa);
                          else {
                            ScaffoldMessenger.of(bc).showSnackBar(
                                SnackBar(
                                  content: const Text('Awesome SnackBar!'),
                                  duration: const Duration(milliseconds: 1500),
                                  width: 280.0, // Width of the SnackBar...
                                  behavior: SnackBarBehavior.floating,
                                )
                            );//
                          }
                        },
                      ),
                    ),
                  ),

                  Expanded(
                    child: GridView.count(
                      crossAxisCount: largura > 1000 ? 4 : (largura > 700 ? 3 : (largura > 500 ? 2 : 1)),
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                      mainAxisExtent: 100,
                      children: List.generate(jogadores.length, (index) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Image.asset(jogadores[index].image),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 15, right: 15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(jogadores[index].nome, style: TextStyle(color: Color(0xFF323232))),
                                        Text("# " + jogadores[index].numero.toString(), style: TextStyle(color: Color(0xFFC9082A))),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: IconButton(
                                    onPressed: (){},
                                    icon: Icon(
                                        jogadores[index].favorito ? Icons.favorite : Icons.favorite_border,
                                        color: Color(jogadores[index].favorito ? 0xFFC9082A : 0xFF17408B)
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ),
                ],
              ),
            ),
        )
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