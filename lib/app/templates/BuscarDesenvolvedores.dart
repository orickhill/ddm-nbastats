import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/app/Models/Desenvolvedor.dart';
import 'package:projeto/app/Providers/ControleFavoritos.dart';
import 'package:provider/provider.dart';

/*void main(){
  runApp(MinhaApp());
}*/
/*class BuscarDesenvolvedores extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: BuscarDesenvolvedoresState(),
    );
  }
}*/

class BuscarDesenvolvedores extends StatefulWidget{
  _BuscarDesenvolvedores createState() => _BuscarDesenvolvedores();
}

class _BuscarDesenvolvedores extends State {
  final List<Desenvolvedor> desenvolvedoresFull = <Desenvolvedor>[
    Desenvolvedor(0, 'images/desenvolvedores/foto1.png', "Ana Silva", 15, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(1, 'images/desenvolvedores/foto2.png', "Carlos Souza", 23, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(2, 'images/desenvolvedores/foto4.jpg', "Julia Lima", 20, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(3, 'images/desenvolvedores/foto1.png', "Júlia Pereira", 30, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(4, 'images/desenvolvedores/foto4.jpg', "Ana Souza", 8, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(5, 'images/desenvolvedores/foto3.jpg', "Carlos Eduardo", 2, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(6, 'images/desenvolvedores/foto2.png', "Gui Santos", 15, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(7, 'images/desenvolvedores/foto3.png', "Pedro Alves", 23, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(8, 'images/desenvolvedores/foto2.jpg', "Lucas Lima", 20, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(9, 'images/desenvolvedores/foto3.png', "Lucas Pedrosa", 30, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(10, 'images/desenvolvedores/foto1.jpg', "Francisca Oliveira", 8, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
    Desenvolvedor(11, 'images/desenvolvedores/foto4.jpg', "Ana Barbosa", 2, false, "Sou uma desenvolvedora full stack apaixonada por transformar ideias em  soluções digitais. Tenho experiência em HTML, CSS, JavaScript, Node.js e  SQL."),
  ];
  String pesquisa = "";
  List<Desenvolvedor> desenvolvedores = [];

  void initState(){ // inicia o estado da lista exibida
    super.initState();
    desenvolvedores = desenvolvedoresFull;
  }

  Widget build(BuildContext bc){
    final largura = MediaQuery.of(bc).size.width;


    final favoritosProvider = bc.watch<ControleFavoritos>();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text("Pesquisar Desenvolvedores", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            TextField(
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]"))],
              keyboardType: TextInputType.text,
              onChanged: (texto){
                setState(() {
                  pesquisa = texto;
                });
                print(pesquisa);
              }, // alimentando a variável de pesquisa
              decoration: InputDecoration(
                hintText: "Pesquisar Desenvolvedor...",
                border: OutlineInputBorder(),
                suffixIcon: Builder(builder: (BuildContext nc){
                  return IconButton(//vasco
                    icon: Icon(Icons.search),
                    onPressed: () {
                      if(pesquisa.length >= 3){
                        print("Pesquisando por: " + pesquisa);
                        //int i = 0;

                        List<Desenvolvedor> desenvolvedoresFtds = [];
                        for(int i = 0; i < desenvolvedoresFull.length; i++){
                          Desenvolvedor dev = desenvolvedoresFull[i];
                          if(dev.nome.contains(RegExp(pesquisa, caseSensitive: false))){
                            print("${dev.id}: - ${dev.nome} - ${dev.avaliacao} - ${dev.favorito}");

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
                        print("pesquisa muito curta");
                        final snackBar = SnackBar(
                          content: const Center(child: Text('Caracteres insuficientes. Mínimo de 3.')),
                          duration: Duration(seconds: 3),
                          behavior: SnackBarBehavior.floating,
                          showCloseIcon: true,
                          /*action: SnackBarAction(
                                  label: 'Desfazeres',
                                  onPressed: () {
                                    print("Descurtido...");
                                  },
                                ),*/ // Action
                        );

                        ScaffoldMessenger.of(nc).showSnackBar(snackBar);
                      }
                    },
                  );
                }),
              ),
            ),

            Expanded(
                child: GridView.count(
                  crossAxisCount: largura > 1000 ? 4 : (largura > 700 ? 3 : (largura > 500 ? 2 : 1)),
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  mainAxisExtent: 100,
                  children: List.generate(desenvolvedores.length, (index) {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: (){
                          Desenvolvedor j = desenvolvedores[index];
                          Navigator.pushNamed(bc, "/detalhes", arguments: desenvolvedores[index]);
                          print("Detalhes de ${j.nome} abaixo: ");
                          print("ID: ${j.id}");
                          print("Nome: ${j.nome}");
                          print("Número: ${j.avaliacao}");
                          print("Favorito?: ${j.favorito}");
                          print("Descrição: ${j.desc}");
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Builder(builder: (BuildContext nc){
                              return GestureDetector(
                                onLongPress: (){
                                  print("Press Longo");
                                  final snackBar = SnackBar(
                                    content: Center(child: Text(desenvolvedores[index].desc)),
                                    duration: Duration(seconds: 10),
                                    behavior: SnackBarBehavior.floating,
                                    showCloseIcon: true,
                                  );

                                  ScaffoldMessenger.of(nc).showSnackBar(snackBar);
                                },
                                child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Image.asset(desenvolvedores[index].image),
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
                                    Text(desenvolvedores[index].nome, style: TextStyle(color: Color(0xFF323232))),
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Color(0xFFFFCC00), size: 12),
                                        Icon(Icons.star, color: Color(0xFFFFCC00), size: 12),
                                        Icon(Icons.star, color: Color(0xFFFFCC00), size: 12),
                                        Icon(Icons.star, color: Color(0xFFFFCC00), size: 12),
                                        Icon(Icons.star, color: Color(0xFFFFCC00), size: 12),
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
                                    Desenvolvedor dev = desenvolvedores[index];
                                    //j.favorito = !j.favorito;
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
                                          //j.favorito = !j.favorito;
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