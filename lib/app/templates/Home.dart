import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/app/Models/Desenvolvedor.dart';
import 'package:projeto/app/templates/BuscarDesenvolvedores.dart';
import 'package:projeto/app/templates/Login.dart';
import 'package:projeto/app/templates/Perfil.dart';

class Home extends StatelessWidget{
  Widget build(BuildContext bc){
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Text("Essa é a Home", style: TextStyle(fontSize: 40, color: Colors.green),),
            )
          ],
        ),
      ),
    );
  }
}