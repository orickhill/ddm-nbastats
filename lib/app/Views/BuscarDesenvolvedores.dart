import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/app/Models/Desenvolvedor.dart';
import 'package:projeto/app/Providers/ControleFavoritos.dart';
import 'package:provider/provider.dart';

class BuscarDesenvolvedores extends StatefulWidget{
  const BuscarDesenvolvedores({super.key});

  @override
  _BuscarDesenvolvedores createState() => _BuscarDesenvolvedores();
}

class _BuscarDesenvolvedores extends State {
  final List<Desenvolvedor> desenvolvedoresFull = <Desenvolvedor>[
    Desenvolvedor(0, 'images/desenvolvedores/foto1.png', "Ana Silva", 5, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(1, 'images/desenvolvedores/foto2.png', "Carlos Souza", 3, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(2, 'images/desenvolvedores/foto4.png', "Julia Lima", 2, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(3, 'images/desenvolvedores/foto1.png', "Júlia Pereira", 3, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(4, 'images/desenvolvedores/foto4.png', "Ana Souza", 4, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(5, 'images/desenvolvedores/foto3.png', "Carlos Eduardo", 2, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(6, 'images/desenvolvedores/foto2.png', "Gui Santos", 1, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(7, 'images/desenvolvedores/foto3.png', "Pedro Alves", 3, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(8, 'images/desenvolvedores/foto2.png', "Lucas Lima", 2, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(9, 'images/desenvolvedores/foto3.png', "Lucas Pedrosa", 3, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(10, 'images/desenvolvedores/foto1.png', "Francisca Oliveira", 4, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(11, 'images/desenvolvedores/foto4.png', "Ana Barbosa", 2, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
  ];
  String pesquisa = "";
  List<Desenvolvedor> desenvolvedores = [];

  @override
  void initState(){ // inicia o estado da lista exibida
    super.initState();
    desenvolvedores = desenvolvedoresFull;
  }

  @override
  Widget build(BuildContext bc){
    final largura = MediaQuery.of(bc).size.width; // pega a largura atual da tela
    final favoritosProvider = bc.watch<ControleFavoritos>();

    void pesquisar () {
      if(pesquisa.length >= 3){
        List<Desenvolvedor> desenvolvedoresFtds = [];
        for(int i = 0; i < desenvolvedoresFull.length; i++){
          Desenvolvedor dev = desenvolvedoresFull[i];
          if(dev.nome.contains(RegExp(pesquisa, caseSensitive: false))){
            desenvolvedoresFtds.add(dev);
          }
        }

        setState(() {
          desenvolvedores = desenvolvedoresFtds;
        });
      } else {
        setState(() {
          desenvolvedores = desenvolvedoresFull;
        });
        final snackBar = SnackBar(
          content: const Center(child: Text('Caracteres insuficientes. Mínimo de 3.')),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          showCloseIcon: true,
        );

        ScaffoldMessenger.of(bc).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text("Pesquisar Desenvolvedores", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF323232))),
            ), // Titulo da sessao
            TextField(
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]"))],
              keyboardType: TextInputType.text,
              onChanged: (texto){
                setState(() {
                  pesquisa = texto;
                });
              }, // alimentando a variável de pesquisa
              onSubmitted: (_) => pesquisar(),
              decoration: InputDecoration(
                labelText: "Palvra-chave",
                //hintText: "Pesquisar Desenvolvedor...",
                border: OutlineInputBorder(),
                suffixIcon: Builder(builder: (BuildContext nc){
                  return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: pesquisar,
                  );
                }),
              ),
            ), // Barra de Pesquisa
            Expanded(
                child: GridView.count(
                  crossAxisCount: largura > 1000 ? 4 : (largura > 700 ? 3 : (largura > 500 ? 2 : 1)),
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  mainAxisExtent: 100,
                  children: List.generate(desenvolvedores.length, (index) {
                    Desenvolvedor dev = desenvolvedores[index];
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: (){ // Abrir Detalhes
                          Navigator.pushNamed(bc, "/detalhes", arguments: dev);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Builder(builder: (BuildContext nc){
                              return GestureDetector(
                                onLongPress: (){
                                  print("Press Longo");
                                  final snackBar = SnackBar(
                                    content: Center(child: Text(dev.desc)),
                                    duration: Duration(seconds: 10),
                                    behavior: SnackBarBehavior.floating,
                                    showCloseIcon: true,
                                  );
                                  ScaffoldMessenger.of(nc).showSnackBar(snackBar);
                                },
                                child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Image.asset(dev.image),
                                ),
                              );
                            }),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(dev.nome, style: TextStyle(color: Color(0xFF323232))),
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: dev.avaliacao >= 1 ? Color(0xFFFFCC00) : Colors.grey, size: 12),
                                        Icon(Icons.star, color: dev.avaliacao >= 2 ? Color(0xFFFFCC00) : Colors.grey, size: 12),
                                        Icon(Icons.star, color: dev.avaliacao >= 3 ? Color(0xFFFFCC00) : Colors.grey, size: 12),
                                        Icon(Icons.star, color: dev.avaliacao >= 4 ? Color(0xFFFFCC00) : Colors.grey, size: 12),
                                        Icon(Icons.star, color: dev.avaliacao >= 5 ? Color(0xFFFFCC00) : Colors.grey, size: 12),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Builder(builder: (BuildContext nc){
                              bool eFavorito = favoritosProvider.isFavorito(index); // verifica favorito
                              return Center(
                                child: IconButton(
                                  onPressed: (){
                                    favoritosProvider.atualizar(index); // atualiza favorito
                                    String feedback = !eFavorito ? "${dev.nome} adicionado a favoritos." : "${dev.nome} removido de favoritos.";
                                    final snackBar = SnackBar(
                                      content: Center(child: Text(feedback)),
                                      duration: Duration(seconds: 5),
                                      behavior: SnackBarBehavior.floating,
                                      showCloseIcon: true,
                                      action: SnackBarAction(
                                        label: 'Desfazer',
                                        onPressed: () {
                                          favoritosProvider.atualizar(index); // atualiza favorito
                                        },
                                      ),
                                    );

                                    ScaffoldMessenger.of(nc).showSnackBar(snackBar);
                                  },
                                  icon: Icon(
                                      eFavorito ? Icons.favorite : Icons.favorite_border,
                                      color: Color(eFavorito ? 0xFFC9082A : 0xFF682EA3)
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    );
                  },
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}