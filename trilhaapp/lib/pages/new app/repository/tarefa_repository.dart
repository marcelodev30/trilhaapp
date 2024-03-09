import 'package:flutter/cupertino.dart';
import '../tarefas/tarefa.mode.dart';

class TarefaRepository extends ChangeNotifier {
  final _tarefa = <TarefaModelV2>[];

  get getTarefa => _tarefa;

  adicionar(TarefaModelV2 tarefaModel) {
    _tarefa.add(tarefaModel);
    notifyListeners();
  }

  alterar(String id, bool concluido) {
    _tarefa.where((element) => element.id == id).first.concluido = concluido;
    notifyListeners();
  }

  remove(String id) {
    _tarefa.remove(_tarefa.where((element) => element.id == id).first);
    notifyListeners();
  }
}
