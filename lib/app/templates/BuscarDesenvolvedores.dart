import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/app/Models/Desenvolvedor.dart';

/*void main(){
  runApp(MinhaApp());
}*/

class Buscardesenvolvedores extends StatelessWidget{
  final List<Desenvolvedor> desenvolvedores = <Desenvolvedor>[
    Desenvolvedor(0, 'images/jogadores/santos.png', "Gui Santos", 15, true, "Guilherme Carvalho dos Santos (born 22 June 2002) is a Brazilian professional basketball player for the Golden State Warriors of the National Basketball Association (NBA)."),
    Desenvolvedor(1, 'images/jogadores/green.png', "Draymond Green", 23, true, "Draymond Jamal Green Sr. (born March 4, 1990) is an American professional basketball player for the Golden State Warriors of… frontcourt players capable of playing and defending multiple positions, making plays for teammates, and spacing the floor."),
    Desenvolvedor(2, 'images/jogadores/horford.jpg', "Al Horford", 20, false, "Alfred Joel Horford Reynoso OMDSM (born June 3, 1986), nicknamed Big Al, is a Dominican professional basketball player for t…prior to the 2021 season. He reached the NBA Finals with the Celtics in 2022 and 2024, winning his first NBA title in 2024."),
    Desenvolvedor(3, 'images/jogadores/curry.png', "Stephen Curry", 30, true, "Stephen Curry (born March 14, 1988) is an American professional basketball player for the Golden State Warriors, widely recognized as the greatest shooter in NBA history."),
    Desenvolvedor(4, 'images/jogadores/melton.jpg', "De'Anthony Melton", 8, false, "De'Anthony Melton (born May 28, 1998), nicknamed 'Mr. Do Something', is an American professional basketball player for the G…before being traded to the Philadelphia 76ers during the 2022 off-season. He has also played for the Golden State Warriors."),
    Desenvolvedor(5, 'images/jogadores/podziemsk.jpg', "Brandin Podziemski", 2, false, "De'Anthony Melton (born May 28, 1998), nicknamed 'Mr. Do Something', is an American professional basketball player for the G…before being traded to the Philadelphia 76ers during the 2022 off-season. He has also played for the Golden State Warriors."),
    Desenvolvedor(6, 'images/jogadores/santos.png', "Gui Santos", 15, true, "Guilherme Carvalho dos Santos (born 22 June 2002) is a Brazilian professional basketball player for the Golden State Warriors of the National Basketball Association (NBA)."),
    Desenvolvedor(7, 'images/jogadores/green.png', "Draymond Green", 23, true, "Draymond Jamal Green Sr. (born March 4, 1990) is an American professional basketball player for the Golden State Warriors of… frontcourt players capable of playing and defending multiple positions, making plays for teammates, and spacing the floor."),
    Desenvolvedor(8, 'images/jogadores/horford.jpg', "Al Horford", 20, false, "Alfred Joel Horford Reynoso OMDSM (born June 3, 1986), nicknamed Big Al, is a Dominican professional basketball player for t…prior to the 2021 season. He reached the NBA Finals with the Celtics in 2022 and 2024, winning his first NBA title in 2024."),
    Desenvolvedor(9, 'images/jogadores/curry.png', "Stephen Curry", 30, true, "Stephen Curry (born March 14, 1988) is an American professional basketball player for the Golden State Warriors, widely recognized as the greatest shooter in NBA history."),
    Desenvolvedor(10, 'images/jogadores/melton.jpg', "De'Anthony Melton", 8, false, "De'Anthony Melton (born May 28, 1998), nicknamed 'Mr. Do Something', is an American professional basketball player for the G…before being traded to the Philadelphia 76ers during the 2022 off-season. He has also played for the Golden State Warriors."),
    Desenvolvedor(11, 'images/jogadores/podziemsk.jpg', "Brandin Podziemski", 2, false, "De'Anthony Melton (born May 28, 1998), nicknamed 'Mr. Do Something', is an American professional basketball player for the G…before being traded to the Philadelphia 76ers during the 2022 off-season. He has also played for the Golden State Warriors."),
  ];
  Widget build(BuildContext bc){
    final largura = MediaQuery.of(bc).size.width;
    String pesquisa = "";
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Text("Pesquisar jogadores", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text("Pesquisar Desenvolvedores", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            TextField(
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]"))],
              keyboardType: TextInputType.text,
              onChanged: (texto) => pesquisa = texto, // alimentando a variável de pesquisa
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
                        for(int i = 0; i < desenvolvedores.length; i++){
                          Desenvolvedor j = desenvolvedores[i];
                          if(j.nome.contains(RegExp(pesquisa, caseSensitive: false)))
                            print("${j.id}: - ${j.nome} - ${j.avaliacao} - ${j.favorito}");
                        }
                      } else {
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
                                    /*action: SnackBarAction(
                                  label: 'Desfazeres',
                                  onPressed: () {
                                    print("Descurtido...");
                                  },
                                ),*/ // Action
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
                              return Center(
                                child: IconButton(
                                  onPressed: (){
                                    Desenvolvedor j = desenvolvedores[index];
                                    print("favorito? ${j.favorito}");
                                    j.favorito = !j.favorito;
                                    print("favorito? ${j.favorito}");
                                    String feedback = j.favorito ? "${j.nome} adicionado a favoritos." : "${j.nome} removido de favoritos.";
                                    final snackBar = SnackBar(
                                      content: Center(child: Text(feedback)),
                                      duration: Duration(seconds: 5),
                                      behavior: SnackBarBehavior.floating,
                                      showCloseIcon: true,
                                      action: SnackBarAction(
                                        label: 'Desfazer',
                                        onPressed: () {
                                          //print("Descurtido...");
                                          j.favorito = !j.favorito;
                                          print("favorito? ${j.favorito}");
                                        },
                                      ), // Action
                                    );

                                    ScaffoldMessenger.of(nc).showSnackBar(snackBar);
                                  },
                                  icon: Icon(
                                      desenvolvedores[index].favorito ? Icons.favorite : Icons.favorite_border,
                                      color: Color(desenvolvedores[index].favorito ? 0xFFC9082A : 0xFF682EA3)
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