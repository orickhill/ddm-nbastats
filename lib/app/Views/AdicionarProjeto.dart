import 'package:flutter/material.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class AdicionarProjeto extends StatefulWidget {

  @override
  _AdicionarProjeto createState() => _AdicionarProjeto();
}

class _AdicionarProjeto extends State {
  int descTextFieldHeight = 0;
  int lineLength = 0;

  @override
  void initState(){
    super.initState();
    descTextFieldHeight = 50;
    lineLength = 1;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(15),
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        backgroundColor: const Color(0xFF682EA3),
        title: Text("Adicionar Projeto", style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          spacing: 10,
          children: [
            SizedBox( // Nome
              width: double.infinity,
              height: 50,
              child: TextField(
                keyboardType: TextInputType.text,
                onChanged: (texto){
                  print(texto);
                },
                decoration: InputDecoration(
                  //filled: true,
                  //fillColor: Colors.white,
                  labelText: "Título do Projeto",
                  //hintText: "Nome",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox( // Setor
              width: double.infinity,
              height: 50,
              child: TextField(
                keyboardType: TextInputType.text,
                onChanged: (texto){
                  print(texto);
                },
                decoration: InputDecoration(
                  //filled: true,
                  //fillColor: Colors.white,
                  labelText: "Setor",
                  //hintText: "Nome",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox( // Descrição
              height: descTextFieldHeight.toDouble(),
              child: TextField(
                maxLines: 8,
                keyboardType: TextInputType.text,
                style: TextStyle(),
                onChanged: (texto){
                  print("numberLines: " + lineLength.toString());
                  setState(() {
                    lineLength = '\\n'.allMatches(texto).length + 1;//texto.split(RegExp(r'\r?\n')).length;
                  });
                  setState(() {
                    descTextFieldHeight = descTextFieldHeight == 50*8 ? descTextFieldHeight : lineLength * 50;
                  });
                },
                decoration: InputDecoration(
                  //filled: true,
                  //fillColor: Colors.white,
                  labelText: "Descrição",
                  //hintText: "Nome",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text("Selecione a categoria"),
                SizedBox(
                  height: 50,
                  child: DropDownCategorias(),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}

// DropDown para selecionar a categoria
class DropDownCategorias extends StatefulWidget {
  const DropDownCategorias({super.key});

  @override
  _DropDownCategorias createState() => _DropDownCategorias();
}

class _DropDownCategorias extends State {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context){
    return DropdownButton(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down_sharp),
      elevation: 16,
      onChanged: (value){
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }
}