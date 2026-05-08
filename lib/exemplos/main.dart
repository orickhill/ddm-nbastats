import 'package:flutter/material.dart';

void main(){
  runApp(MinhaApp());
}

class MinhaApp extends StatelessWidget{
  Widget build(BuildContext bc){
    return MaterialApp(
        title: "Ola Mundo!",
        home: Scaffold(
            appBar: AppBar(title: Text("OlaApp")),
            body:
            Row(
              children: [
                Expanded(flex: 1, child: Container(color: Colors.red)),
                Expanded(flex: 2, child: Container(color: Colors.green)),
                Expanded(flex: 1, child: Container(color: Colors.blue)),

                /*Flexible(flex: 1, child: Container(color: Colors.red)),
                Flexible(flex: 2, child: Container(color: Colors.green)),
                Flexible(flex: 1, child: Container(color: Colors.blue)),*/
              ],
            )
        )
    );
  }
}