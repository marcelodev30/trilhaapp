import 'package:app_imc/models/imc.model.dart';
import 'package:flutter/material.dart';

class ImcResponsitory extends ChangeNotifier {
  List<ImcModels> _imcs = [];

  List<ImcModels> get getImcs => _imcs;

  void add(ImcModels value) {
    _imcs.add(value);
    notifyListeners();
  }

  String saidas(double imc) {
    var resultado = '';
    if (imc <= 18.5) {
      resultado = 'Abaixo do peso normal';
    }
    if (imc >= 18.6 && imc <= 24.9) {
      resultado = 'Peso Normal';
    }
    if (imc >= 25.0 && imc <= 29.9) {
      resultado = 'Sobrepeso';
    }
    if (imc >= 30.0 && imc <= 34.9) {
      resultado = 'Obesidade grau I';
    }
    if (imc >= 35.0 && imc <= 39.9) {
      resultado = 'Obesida de grau II';
    }
    if (imc >= 40.0) {
      resultado = 'Obesida de grau III';
    }
    return resultado;
  }
}
