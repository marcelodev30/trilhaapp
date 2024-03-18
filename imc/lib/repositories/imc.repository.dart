//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:imc/models/models.dart';

class ImcRepositort extends ChangeNotifier {
  var _listImc = <ImcModels>[
    ImcModels.c(1.6, 60, 22),
  ];

  List<ImcModels> get getListaIMC => _listImc;

  void setAddList(ImcModels value) {
    _listImc.add(value);
    notifyListeners();
  }
}
