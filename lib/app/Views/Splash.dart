import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto/app/Views/Login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _Splash createState() => _Splash();
}

class _Splash extends State {

  @override
  void initState(){
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
      Login()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext bc){
    return MaterialApp(
      title: 'Splash',
      home: Scaffold(
        body: Container(
          color: Color(0xFF682EA3),
          child: Center(
            child: SizedBox(
              width: 210,
              child: Image.asset('images/splash.png'),
            ),
          )
        )
      ),
    );
  }
}