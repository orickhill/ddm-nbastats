import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/app/Models/Desenvolvedor.dart';

class Avaliardesenvolvedor extends StatefulWidget {
  const Avaliardesenvolvedor({super.key});

  @override
  _Avaliardesenvolvedor createState() => _Avaliardesenvolvedor();
}

class _Avaliardesenvolvedor extends State {

  @override
  Widget build(BuildContext bc){
    final dev = ModalRoute.of(bc)!.settings.arguments as Desenvolvedor;

    return Scaffold(
      appBar: AppBar(
          actionsPadding: EdgeInsets.all(15),
          iconTheme: IconThemeData(color: Colors.white, size: 40),
          backgroundColor: const Color(0xFF682EA3),
          title: Text("Avaliação", style: TextStyle(color: Colors.white, fontSize: 25),),
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            spacing: 16,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(padding: EdgeInsets.all(15), child: Row(
                  children: [
                    SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: Image.asset(
                            dev.image,
                            fit: BoxFit.cover,
                          ),
                        )
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(dev.nome,style: TextStyle(fontSize: 22),),
                      ),
                    )
                  ],
                ),)
              ),
              AvaliarForm()
            ],
          )
      ),
    );
  }
}

class AvaliarForm extends StatefulWidget {
  const AvaliarForm({super.key});

  @override
  _AvaliarForm createState() => _AvaliarForm();
}

class _AvaliarForm extends State {
  final _formKey = GlobalKey<FormState>();
  int estrelas = 0;
  String comentario = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 16,
        children: [
          Column(
            spacing: 8,
            children: [
              Text("Selecione de 1 a 5 estrelas de acordo com a sua experiência:"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        if(estrelas == 1){
                          estrelas = 0;
                          return;
                        }
                        estrelas = 1;
                      });
                    },
                    child: Icon(Icons.star, color: estrelas >= 1 ? Color(0xFFFFCC00) : Colors.grey, size: 50),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        estrelas = 2;
                      });
                    },
                    child: Icon(Icons.star, color: estrelas >= 2 ? Color(0xFFFFCC00) : Colors.grey, size: 50),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        estrelas = 3;
                      });
                    },
                    child: Icon(Icons.star, color: estrelas >= 3 ? Color(0xFFFFCC00) : Colors.grey, size: 50),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        estrelas = 4;
                      });
                    },
                    child: Icon(Icons.star, color: estrelas >= 4 ? Color(0xFFFFCC00) : Colors.grey, size: 50),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        estrelas = 5;
                      });
                    },
                    child: Icon(Icons.star, color: estrelas >= 5 ? Color(0xFFFFCC00) : Colors.grey, size: 50),
                  ),
                  //Icon(Icons.star, color: estrelas == 5 ? Color(0xFFFFCC00) : Colors.grey, size: 12),
                ],
              ),
            ],
          ),
          TextFormField(
            minLines: 3,
            maxLines: 8,
            keyboardType: TextInputType.multiline,
            style: TextStyle(),
            onChanged: (texto){
              setState(() {
                comentario = texto;
              });
            },
            decoration: InputDecoration(
              labelText: "Comentário",
              alignLabelWithHint: true,
              hintText: "Digite seu feedback...",
              border: OutlineInputBorder(),
            ),
          ),
          TextButton(
            onPressed: (){
              if(estrelas == 0){
                showDialog(context: context, builder: (context) => AlertDialog(
                  title: Text("Estrelas não selecionadas"),
                  content: Text("Por favor, selecione a quantidade de estrelas para enviar a avalação."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Fechar', style: TextStyle(color: Colors.red),),
                    ),
                  ],
                ));
                return;
              }
              if(_formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Enviando feedback..."))
                );
                //Navigator.pushReplacementNamed(context, '/home');
              }
            },
            child: Container(
              width: 280,
              height: 40,
              color: Color(0xFFA379CF),
              child: Center(
                  child: Text("Enviar", style: TextStyle(color: Colors.white,),)
              ),
            ),
          )
        ],
      ),
    );
  }
}