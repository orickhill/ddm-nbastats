import 'package:flutter/material.dart';

class Login extends StatelessWidget{
  const Login({super.key});

  @override
  Widget build(BuildContext bc){
    String email = "";
    String password = "";
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        backgroundColor: Color(0xFF682EA3),
        body: Center(
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.asset('images/login-icon.png'),
              ),
              SizedBox(),
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
                    //labelText: "E-mail",
                    labelStyle: TextStyle(color: Color(0xFF323232)),
                    hintText: "Informe seu email...", // Informe sua senha
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                width: 280,
                height: 40,
                child: TextField( // senha
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  onChanged: (texto){
                    password = texto;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    //labelText: "Senha",
                    labelStyle: TextStyle(color: Color(0xFF323232)),
                    hintText: "Informe sua senha...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(bc, '/home');
                },
                child: Container(
                  width: 280,
                  height: 40,
                  color: Color(0xFF48A65B),
                  child: Center(
                      child: Text("Entrar", style: TextStyle(color: Colors.white,),)
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(bc, "/cadastrar");
                },
                child: Container(
                  width: 280,
                  height: 40,
                  color: Color(0xFF4294A2),
                  child: Center(
                      child: Text("Criar Conta", style: TextStyle(color: Colors.white,),)
                  ),
                ),
              ),
              /*GestureDetector(
                onTap: (){
                  print("Entrar como visitante...");
                },
                child: Container(
                  width: 280,
                  height: 40,
                  color: Color(0xFF323232),
                  child: Center(
                      child: Text("Entrar como visitante", style: TextStyle(color: Colors.white,),)
                  ),
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}