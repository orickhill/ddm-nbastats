import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(DetalharDesenvolvedor());
}

class DetalharDesenvolvedor extends StatelessWidget{
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
    return MaterialApp(
      title: 'Detalhes',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF682EA3),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => print("Voltando"),
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 40),
              ),
              IconButton(
                  onPressed: () => print("compartilhando..."),
                  icon: Icon(Icons.share, color: Colors.white, size: 40)
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.asset(desenvolvedores[0].image),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(desenvolvedores[0].nome, style: TextStyle(color: Color(0xFF323232), fontSize: 22)),
                      Row(
                        children: [
                          Icon(Icons.star, color: Color(0xFFFFCC00), size: 12),
                          Icon(Icons.star, color: Color(0xFFFFCC00), size: 12),
                          Icon(Icons.star, color: Color(0xFFFFCC00), size: 12),
                          Icon(Icons.star, color: Color(0xFFFFCC00), size: 12),
                          Icon(Icons.star, color: Color(0xFFFFCC00), size: 12),
                          Text(" (5.0 - " + desenvolvedores[0].avaliacao.toString() + " avalações)", style: TextStyle(color: Color(0xFF323232), fontSize: 15)),
                        ],
                      ),
                      Text("Setores: E-commerce, beleza, IA.", style: TextStyle(color: Color(0xFF323232), fontSize: 15))
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Sobre mim",  style: TextStyle(color: Color(0xFF323232), fontSize: 25)),
                  Text(
                      desenvolvedores[0].desc,
                      style: TextStyle(color: Color(0xFF323232), fontSize: 15)
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Desenvolvedor {
  int id;
  String image;
  String nome;
  int avaliacao;
  bool favorito;
  String desc;
  Desenvolvedor(this.id, this.image, this.nome, this.avaliacao, this.favorito, this.desc);
}