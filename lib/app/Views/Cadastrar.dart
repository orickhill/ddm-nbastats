import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Cadastrar extends StatelessWidget{
  const Cadastrar({super.key});

  @override
  Widget build(BuildContext bc){
    return Scaffold(
      //backgroundColor: Color(0xFF682EA3),
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(15),
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        backgroundColor: const Color(0xFF682EA3),
        title: Text("Cadastre-se", style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            spacing: 8,
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                spacing: 5,
                children: [
                  SizedBox(
                    width: 300, //fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF323232)
                    child: Text("Boas-vindas!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Color(0xFF323232)), textAlign: TextAlign.center),
                  ),
                  SizedBox(
                    width: 300,
                    child: Text("Para se cadastrar na plataforma, preencha corretamente o formulário com os seus dados.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200, color: Color(0xFF323232)), textAlign: TextAlign.justify,),
                  ),
                ],
              ),
              CadastroForm(),
            ],
          ),
        )
      )
    );
  }
}

class CadastroForm extends StatefulWidget {
  const CadastroForm({super.key});

  @override
  _CadastroForm createState() {
    return _CadastroForm();
  }
}

class _CadastroForm extends State<CadastroForm> {
  final _formKey = GlobalKey<FormState>();
  String nome = "";
  String sobrenome = "";
  String cpf = "";
  String github = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 16,
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField( // nome
            keyboardType: TextInputType.text,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]"))],
            decoration: InputDecoration(
              labelText: "Nome",
              hintText: "Digite seu nome",
            ),
            onChanged: (valor){
              setState(() {
                nome = valor;
              });
            },
            validator: (value){
              if(value == null || value.isEmpty){
                return "O campo Nome é obrigatório";
              }
              return null;
            },
          ),
          TextFormField( // sobrenome
            keyboardType: TextInputType.text,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]"))],
            decoration: InputDecoration(
              labelText: "Sobrenome",
              hintText: "Digite seu sobrenome",
            ),
            onChanged: (valor){
              setState(() {
                sobrenome = valor;
              });
            },
            validator: (value){
              if(value == null || value.isEmpty){
                return "O campo Sobrenome é obrigatório";
              }
              return null;
            },
          ),
          TextFormField( // CPF
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))],
            decoration: InputDecoration(
              labelText: "CPF",
              hintText: "Digite seu CPF",
            ),
            onChanged: (valor){
              setState(() {
                cpf = valor;
              });
            },
            validator: (value){
              if(value == null || value.isEmpty){
                return "O campo CPF é obrigatório";
              }
              return null;
            },
          ),
          TextFormField( // github
            keyboardType: TextInputType.text,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]"))],
            decoration: InputDecoration(
              labelText: "Github",
              hintText: "Digite seu Github",
            ),
            onChanged: (valor){
              setState(() {
                github = valor;
              });
            },
            validator: (value){
              if(value == null || value.isEmpty){
                return "O campo Github é obrigatório";
              }
              return null;
            },
          ),
          TextFormField( // e-mail
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "E-mail",
              hintText: "Digite seu e-mail",
            ),
            onChanged: (valor){
              setState(() {
                email = valor;
              });
            },
            validator: (value){
              if(value == null || value.isEmpty){
                return "O campo E-mail é obrigatório";
              }
              return null;
            },
          ),
          TextFormField( // senha
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Senha",
              hintText: "Digite sua senha segura",
            ),
            onChanged: (valor){
              setState(() {
                password = valor;
              });
            },
            validator: (value){
              if(value == null || value.isEmpty){
                return "O campo Senha é obrigatório";
              }
              return null;
            },
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
              color: Color(0xFF4294A2),
              child: Center(
                child: Text("Cadastre-se", style: TextStyle(color: Colors.white,),)
              ),
            ),
          )
        ],
      ),
    );
  }
}



/*          SizedBox(
              width: 280,
              height: 40,
              child: TextField( // Nome
                keyboardType: TextInputType.text,
                onChanged: (texto){
                  nome = texto;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Nome",
                  hintText: "Digite seu nome",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              width: 280,
              height: 40,
              child: TextField( // Sobrenome
                keyboardType: TextInputType.text,
                onChanged: (texto){
                  sobrenome = texto;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Sobrenome",
                  hintText: "Digite seu sobrenome",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              width: 280,
              height: 40,
              child: TextField( // CPF
                keyboardType: TextInputType.text,
                onChanged: (texto){
                  cpf = texto;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "CPF",
                  hintText: "Digite seu CPF",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              width: 280,
              height: 40,
              child: TextField( // github
                keyboardType: TextInputType.text,
                onChanged: (texto){
                  github = texto;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Github",
                  hintText: "Digite seu usuário do Github",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              width: 280,
              height: 40,
              child: TextField( // email
                keyboardType: TextInputType.emailAddress,
                onChanged: (texto){
                  email = texto;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "E-mail", // Informe sua senha
                  hintText: "Digite seu e-mail", // Informe sua senha
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              width: 280,
              height: 40,
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.text,
                onChanged: (texto){
                  password = texto;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Senha",
                  hintText: "Digite seu senha segura",
                  border: OutlineInputBorder(),
                ),
              ),
            ),*/