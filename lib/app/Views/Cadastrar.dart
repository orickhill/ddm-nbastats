import 'package:flutter/material.dart';

class Cadastrar extends StatelessWidget{
  const Cadastrar({super.key});

  @override
  Widget build(BuildContext bc){
    String nome = "";
    String sobrenome = "";
    String cpf = "";
    String github = "";
    String email = "";
    String password = "";
    return Scaffold(
      backgroundColor: Color(0xFF682EA3),
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(15),
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        backgroundColor: const Color(0xFF682EA3),
        title: Text("Cadastre-se", style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
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
                  hintText: "Nome",
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
                  hintText: "Sobrenome",
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
                  hintText: "CPF",
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
                  hintText: "Github",
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
                  hintText: "Email", // Informe sua senha
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
                  hintText: "Senha...",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacementNamed(bc, '/home');
              },
              child: Container(
                width: 280,
                height: 40,
                color: Color(0xFF7C5C9D),
                child: Center(
                    child: Text("Cadastre-se", style: TextStyle(color: Colors.white,),)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}