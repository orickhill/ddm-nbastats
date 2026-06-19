import 'package:flutter/material.dart';
import 'package:projeto/app/templates/Home.dart';
import 'package:flutter/services.dart';
import 'package:projeto/app/templates/NavigationHub.dart';

class Mostraravaliacoes extends StatelessWidget{

  Widget build(BuildContext bc){
    return Scaffold(
      appBar: AppBar(
          actionsPadding: EdgeInsets.all(15),
          iconTheme: IconThemeData(color: Colors.white, size: 40),
          backgroundColor: const Color(0xFF682EA3),
          title: Text("Avaliações", style: TextStyle(color: Colors.white, fontSize: 25),),
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Text("Avaliações",  style: TextStyle(color: Color(0xFF323232), fontSize: 25)),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentGeometry.topLeft,
                        child: Text("Ótimo",  style: TextStyle(color: Color(0xFF4294A2), fontSize: 22)),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, color: Color(0xFFFFCC00), size: 15),
                              Icon(Icons.star, color: Color(0xFFFFCC00), size: 15),
                              Icon(Icons.star, color: Color(0xFFFFCC00), size: 15),
                              Icon(Icons.star, color: Color(0xFFFFCC00), size: 15),
                              Icon(Icons.star, color: Color(0xFFFFCC00), size: 15),
                            ],
                          ),
                          Text("5.0",  style: TextStyle(color: Color(0xFF323232), fontSize: 15)),
                        ],
                      )
                    ],
                  ),
                  Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Text(
                        "Excelente profissional!",
                        style: TextStyle(color: Color(0xFF323232), fontSize: 18)
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentGeometry.topLeft,
                        child: Text("Ótimo",  style: TextStyle(color: Color(0xFF4294A2), fontSize: 22)),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, color: Color(0xFFFFCC00), size: 15),
                              Icon(Icons.star, color: Color(0xFFFFCC00), size: 15),
                              Icon(Icons.star, color: Color(0xFFFFCC00), size: 15),
                              Icon(Icons.star, color: Color(0xFFFFCC00), size: 15),
                              Icon(Icons.star, color: Color(0xFFFFCC00), size: 15),
                            ],
                          ),
                          Text("5.0",  style: TextStyle(color: Color(0xFF323232), fontSize: 15)),
                        ],
                      )
                    ],
                  ),
                  Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Text(
                        "Excelente profissional!",
                        style: TextStyle(color: Color(0xFF323232), fontSize: 18)
                    ),
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
}