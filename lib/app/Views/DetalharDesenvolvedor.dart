import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/app/Models/AvaliacaoDesenvolvedor.dart';
import 'package:projeto/app/Models/Desenvolvedor.dart';
import 'package:projeto/app/Models/Sistema.dart';

class DetalharDesenvolvedor extends StatefulWidget{
  const DetalharDesenvolvedor({super.key});

  @override
  _DetalharDesenvolvedor createState() => _DetalharDesenvolvedor();
}

class _DetalharDesenvolvedor extends State{
  /*final List<Desenvolvedor> desenvolvedores = <Desenvolvedor>[
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
  ];*/

  int optionBarra = 1; // 1, 2 ou 3.

  @override
  void initState(){
    super.initState();
    optionBarra = 1;
  }

  @override
  Widget build(BuildContext bc){
    final List<Sistema> sistemas = <Sistema>[
      Sistema(1, 'images/barbearia.jpg', 'Mariano Cabeleleiro', 'Salão, Website, agenda', 'Esse é um sistema para salão de beleza'),
      Sistema(2, 'images/barbearia.jpg', 'Edimilson Hair', 'Salão, Website, agenda', 'Esse é um sistema para salão de beleza'),
      Sistema(3, 'images/barbearia.jpg', 'Hype', 'Salão, Website, agenda', 'Esse é um sistema para salão de beleza'),
    ];
    final List<AvaliacaoDesenvolvedor> avaliacoes = <AvaliacaoDesenvolvedor>[
      AvaliacaoDesenvolvedor(1, 5, "excelente profissional!", 1, 2),
      AvaliacaoDesenvolvedor(2, 3, "demorou na entrega!", 1, 2),
      AvaliacaoDesenvolvedor(3, 5, "ótimo para trabalhar junto!", 1, 2),
      AvaliacaoDesenvolvedor(4, 4, "pequenos problemas com a adaptação mas gostei!", 1, 2),
    ];
    final args = ModalRoute.of(bc)!.settings.arguments as Desenvolvedor;

    Widget mostrarDescricao(){
      return Column(
        children: [
          Align(
            alignment: AlignmentGeometry.topLeft,
            child: Text("Sobre mim",  style: TextStyle(color: Color(0xFF323232), fontSize: 25)),
          ),
          Text(
              args.desc,
              style: TextStyle(color: Color(0xFF323232), fontSize: 15)
          ),
        ],
      );
    }

    Widget mostrarProjetos(){
      return Column(
        children: [
          Text("Projetos",  style: TextStyle(color: Color(0xFF323232), fontSize: 25)),
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            //childAspectRatio: 1.2,
            children: List.generate(sistemas.length, (index){
              return Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                      child: Image.asset(
                        sistemas[index].image,
                        fit: BoxFit.cover,
                        height: 120,
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('Sistema ${sistemas[index].nome}', style: TextStyle(color: Color(0xFF323232), fontSize: 16),),
                        subtitle: Text('Sistema ${sistemas[index].setor}', style: TextStyle(color: Color(0xFF4294A2), fontSize: 14),),
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ],
      );
    }

    Widget mostrarAvaliacoes(){
      return Column(
        children: [
          Align(
            alignment: AlignmentGeometry.topLeft,
            child: Text("Avaliações",  style: TextStyle(color: Color(0xFF323232), fontSize: 25)),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: avaliacoes.length,
            itemBuilder: (context, index){
              return Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: AlignmentGeometry.topLeft,
                            child: Text(
                                avaliacoes[index].estrela == 5 ? "Ótimo" : avaliacoes[index].estrela == 4 ? "Bom" : avaliacoes[index].estrela == 3 ? "Regular" : avaliacoes[index].estrela == 2 ? "Ruim" : "Muito Ruim",
                                style: TextStyle(color: Color(0xFF4294A2), fontSize: 22)
                            ),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star, color: avaliacoes[index].estrela >= 1 ? Color(0xFFFFCC00) : Colors.grey, size: 12),
                                  Icon(Icons.star, color: avaliacoes[index].estrela >= 2 ? Color(0xFFFFCC00) : Colors.grey, size: 12),
                                  Icon(Icons.star, color: avaliacoes[index].estrela >= 3 ? Color(0xFFFFCC00) : Colors.grey, size: 12),
                                  Icon(Icons.star, color: avaliacoes[index].estrela >= 4 ? Color(0xFFFFCC00) : Colors.grey, size: 12),
                                  Icon(Icons.star, color: avaliacoes[index].estrela >= 5 ? Color(0xFFFFCC00) : Colors.grey, size: 12),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(avaliacoes[index].estrela.toString(),  style: TextStyle(color: Color(0xFF323232), fontSize: 15)),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      Align(
                        alignment: AlignmentGeometry.topLeft,
                        child: Text(
                            '"${avaliacoes[index].comentario}"',
                            style: TextStyle(color: Color(0xFF323232), fontSize: 18)
                        ),
                      )
                    ],
                  ),
                )
              );
            },
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(15),
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        backgroundColor: const Color(0xFF682EA3),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(args.nome.toString(), style: TextStyle(color: Colors.white, fontSize: 25),),
            IconButton(
                onPressed: () => print("compartilhando..."),
                icon: Icon(Icons.share, color: Colors.white, size: 40)
            ),
          ],
        )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            spacing: 16,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.asset(args.image),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(args.nome, style: TextStyle(color: Color(0xFF323232), fontSize: 22)),
                      Row(
                        children: [
                          Icon(Icons.star, color: args.avaliacao >= 1 ? Color(0xFFFFCC00) : Colors.grey, size: 12),
                          Icon(Icons.star, color: args.avaliacao >= 2 ? Color(0xFFFFCC00) : Colors.grey, size: 12),
                          Icon(Icons.star, color: args.avaliacao >= 3 ? Color(0xFFFFCC00) : Colors.grey, size: 12),
                          Icon(Icons.star, color: args.avaliacao >= 4 ? Color(0xFFFFCC00) : Colors.grey, size: 12),
                          Icon(Icons.star, color: args.avaliacao >= 5 ? Color(0xFFFFCC00) : Colors.grey, size: 12),
                          Text(" (5.0 - " + args.avaliacao.toString() + " avaliações)", style: TextStyle(color: Color(0xFF323232), fontSize: 15)),
                        ],
                      ),
                      Text("Setores: E-commerce, beleza, IA.", style: TextStyle(color: Color(0xFF323232), fontSize: 15))
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        optionBarra = 1;
                      });
                    },
                    child: Container(
                      width: 115,
                      height: 50,
                      decoration: BoxDecoration(
                          color: optionBarra == 1 ? Colors.deepPurple : Colors.white,
                          border: Border.all(
                            color: Colors.deepPurple, // Border color
                            width: 2.0,         // Border thickness
                          ),
                          borderRadius: BorderRadius.circular(150) // Optional: rounded corners
                      ),
                      child: Center(
                        child: Text('Sobre mim',  style: TextStyle(color: optionBarra == 1 ? Colors.white : Color(0xFF323232)),),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        optionBarra = 2;
                      });
                    },
                    child: Container(
                      width: 115,
                      height: 50,
                      decoration: BoxDecoration(
                          color: optionBarra == 2 ? Colors.deepPurple : Colors.white,
                          border: Border.all(
                            color: Colors.deepPurple, // Border color
                            width: 2.0,         // Border thickness
                          ),
                          borderRadius: BorderRadius.circular(150) // Optional: rounded corners
                      ),
                      child: Center(
                        child: Text('Projetos', style: TextStyle(color: optionBarra == 2 ? Colors.white : Color(0xFF323232)),),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        optionBarra = 3;
                      });
                    },
                    child: Container(
                      width: 115,
                      height: 50,
                      decoration: BoxDecoration(
                          color: optionBarra == 3 ? Colors.deepPurple : Colors.white,
                          border: Border.all(
                            color: Colors.deepPurple, // Border color
                            width: 2.0,         // Border thickness
                          ),
                          borderRadius: BorderRadius.circular(150) // Optional: rounded corners
                      ),
                      child: Center(
                        child: Text('Avaliações', style: TextStyle(color: optionBarra == 3 ? Colors.white : Color(0xFF323232)),),
                      ),
                    ),
                  )

                ],
              ),
              Builder(builder: (BuildContext c){
                if(optionBarra == 1){
                  return mostrarDescricao();
                }
                else if (optionBarra == 2){
                  return mostrarProjetos();
                }
                else {
                  return mostrarAvaliacoes();
                }
              }),
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Center(
                      child: Text("Você pode avaliar essa pessoa!"),
                    ),
                    FloatingActionButton(
                      heroTag: "Avaliar",
                      onPressed: (){
                        Navigator.pushNamed(bc, "/avaliar", arguments: args);
                        //Navigator.of(bc).pushReplacement(MaterialPageRoute(builder: (bc) => NavigationHub()));
                      },
                      child: Text("Avaliar"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}