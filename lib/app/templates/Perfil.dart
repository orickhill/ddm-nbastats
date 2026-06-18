import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Perfil extends StatelessWidget{

  Widget build(BuildContext bc){
    return MaterialApp(
      title: 'Perfil',
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Center(
                child: Text("Perfil", style: TextStyle(fontSize: 40),),
              )
            ],
          ),
        ),
      ),
    );
  }
}