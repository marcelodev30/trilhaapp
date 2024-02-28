// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class Tarefa {
  // ignore: prefer_final_fields
  String _id = UniqueKey().toString();
  // ignore: prefer_final_fields
  String _descricao = '';
  // ignore: prefer_final_fields
  bool _concluido = false;

  String get getId => _id;
  String get getDescricao => _descricao;
  bool get getConcluido => _concluido;

  set setDescricao(String value) => _descricao = value;

  Tarefa(this._descricao, this._concluido);

  void setConcluido(bool concluido) {
    _concluido = concluido;
  }
}
