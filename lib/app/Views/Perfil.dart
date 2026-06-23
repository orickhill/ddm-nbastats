import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/app/Providers/ControleFavoritos.dart';
import 'package:provider/provider.dart';

class Perfil extends StatelessWidget{

  Widget build(BuildContext bc){
    const username = "User";

    final totalFavoritos = bc.watch<ControleFavoritos>().favoritos.length;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF682EA3),
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                username,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 30),
                    const SizedBox(width: 10),
                    Text(
                      "Total de Favoritados: $totalFavoritos",
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}