import 'package:flutter/material.dart';

class ContadorService extends ChangeNotifier {
  int _contador = 0;

  int get getContador => _contador;

  void incrementar() {
    _contador += 1;
    notifyListeners();
  }

  void diminui() {
    if (_contador > 0) {
      _contador -= 1;
      notifyListeners();
    }
  }
}
