import 'package:flutter/material.dart';
import 'package:projeto/app/templates/Home.dart';
import 'package:flutter/services.dart';
import 'package:projeto/app/templates/NavigationHub.dart';

class Login extends StatelessWidget{

  Widget build(BuildContext bc){
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Center(
                child: Text("Tela de Login"),
              ),
              FloatingActionButton(
                heroTag: "Home",
                onPressed: (){
                  Navigator.pushReplacementNamed(bc, '/home');
                  //Navigator.of(bc).pushReplacement(MaterialPageRoute(builder: (bc) => NavigationHub()));
                },
                child: Text("Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}