import 'package:flutter/material.dart';

const List<String> categorias = <String>['One', 'Two', 'Three', 'Four'];
const List<String> statusChoices = <String>['Concluído', 'Em Andamento'];

class AdicionarProjeto extends StatefulWidget {

  @override
  _AdicionarProjeto createState() => _AdicionarProjeto();
}

class _AdicionarProjeto extends State {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(15),
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        backgroundColor: const Color(0xFF682EA3),
        title: Text("Adicionar Projeto", style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            spacing: 10,
            children: [
              SizedBox(
                width: 320,
                child: Text("Preencha as informações abaixo para adicionar um sistema.", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Color(0xFF323232)), textAlign: TextAlign.center),
              ),
              AdicionarProjetoForm(), // Formulário de Adicionar Projeto
            ],
          ),
        ),
      )
    );
  }
}


class AdicionarProjetoForm extends StatefulWidget {
  const AdicionarProjetoForm({super.key});

  @override
  _AdicionarProjetoForm createState() => _AdicionarProjetoForm();
}


class _AdicionarProjetoForm extends State {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 16,
        children: [
          TextFormField( // Nome
            keyboardType: TextInputType.text,
            onChanged: (texto){
              print(texto);
            },
            decoration: InputDecoration(
              labelText: "Título do Projeto",
              border: OutlineInputBorder(),
            ),
            validator: (value){
              if(value == null || value.isEmpty){
                return "O campo Nome é obrigatório";
              }
              return null;
            },
          ),
          TextFormField( // Setor
            keyboardType: TextInputType.text,
            onChanged: (texto){
              print(texto);
            },
            decoration: InputDecoration(

              labelText: "Setor",
              border: OutlineInputBorder(),
            ),
            validator: (value){
              if(value == null || value.isEmpty){
                return "O campo Setor é obrigatório";
              }
              return null;
            },
          ),
          TextFormField( // Descrição
            minLines: 3,
            maxLines: 8,
            keyboardType: TextInputType.multiline,
            style: TextStyle(),
            onChanged: (texto){
              print(texto);
            },
            decoration: InputDecoration(
              labelText: "Descrição",
              alignLabelWithHint: true,
              hintText: "Descreva os principais pontos do projeto...",
              border: OutlineInputBorder(),
            ),
            validator: (value){
              if(value == null || value.isEmpty){
                return "O campo Descrição é obrigatório";
              }
              return null;
            },
          ),
          Column( // Dropdown Categorias
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 4,
            children: [
              Text("Selecione a categoria", style: TextStyle(fontSize: 18),),
              SizedBox(
                //height: 50,
                //width: 300,
                child: DropDownCategorias(),
              )
            ],
          ),
          Column( // Dropdown Status
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 4,
            children: [
              Text("Selecione o Status", style: TextStyle(fontSize: 18),),
              SizedBox(
                //height: 50,
                //width: 300,
                child: DropDownStatus(),
              )
            ],
          ),
          TextButton(
            onPressed: (){
              if(_formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Salvando dados..."))
                );
                //Navigator.pushReplacementNamed(context, '/home');
              }
            },
            child: Container(
              width: 280,
              height: 40,
              color: Color(0xFF0AA822),
              child: Center(
                child: Text("Adicionar", style: TextStyle(color: Colors.white,),)
              ),
            ),
          )
        ],
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
  String dropdownValue = categorias.first;

  @override
  Widget build(BuildContext context){
    return DropdownButton(
      isExpanded: true,
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down_sharp),
      elevation: 16,
      onChanged: (value){
        setState(() {
          dropdownValue = value!;
        });
      },
      items: categorias.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }
}


// DropDown para selecionar o Status do projeto
class DropDownStatus extends StatefulWidget {
  const DropDownStatus({super.key});

  @override
  _DropDownStatus createState() => _DropDownStatus();
}

class _DropDownStatus extends State {
  String dropdownValue = statusChoices.first;

  @override
  Widget build(BuildContext context){
    return DropdownButton(
      isExpanded: true,
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down_sharp),
      elevation: 16,
      onChanged: (value){
        setState(() {
          dropdownValue = value!;
        });
      },
      items: statusChoices.map<DropdownMenuItem<String>>((String value){
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }
}