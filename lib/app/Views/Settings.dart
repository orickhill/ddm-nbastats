import 'package:flutter/material.dart';
import 'package:projeto/app/Views/Home.dart';
import 'package:flutter/services.dart';

class Settings extends StatelessWidget{

  Widget build(BuildContext bc){
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(15),
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        backgroundColor: const Color(0xFF682EA3),
        title: Text("Configurações", style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Text("Tela de Configurações!!!", style: TextStyle(fontSize: 40),),
            ),
          ],
        ),
      ),
    );
  }
}