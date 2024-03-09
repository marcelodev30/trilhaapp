import 'package:flutter/material.dart';

class TarefaModelV2 {
  String id = UniqueKey().toString();
  String descricao = '';
  bool concluido = false;

  TarefaModelV2(this.descricao, this.concluido);
}
