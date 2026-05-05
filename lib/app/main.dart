import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red
  ));
  runApp(MinhaWidget());
}

class MinhaWidget extends StatelessWidget{
  Widget build(BuildContext bc){
    return MaterialApp(
        title: "Ola Mundo!",
        home: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Text("Ola, Rick", style: TextStyle(color: Colors.white)),
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 40,
                )
              ],
            ),
              backgroundColor: Color(0xFF17408B),
          ),
          body: Stack(
            children: [
              Container(
                width: 300,
                height: 300,
                color: Colors.blue,
              ),
              Positioned(
                top: 20,
                left: 20,
                width: 100,
                height: 50,
                child: Container(color: Colors.red),
              ),
            ],
          ),
        )
    );
  }
}