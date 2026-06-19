import 'package:flutter/material.dart';

class ControleFavoritos extends ChangeNotifier {
  final List<int> _favoritos = [];

  List<int> get favoritos => _favoritos;

  bool isFavorito(int devId){
    return _favoritos.contains(devId);
  }

  void atualizar(int devId){
    if(_favoritos.contains(devId)){
      favoritos.remove(devId);
    } else {
      favoritos.add(devId);
    }
    print(devId);
    notifyListeners();
  }
}