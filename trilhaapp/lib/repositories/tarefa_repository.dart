import 'package:trilhaapp/models/tarefa.dart';

class TarefaRespository {
  // ignore: prefer_final_fields
  List<Tarefa> _tarefas = [];

  Future<void> alterar(String id, bool concluido) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tarefas
        .where((tarefa) => tarefa.getId == id)
        .first
        .setConcluido(concluido);
  }

  Future<void> remove(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tarefas.remove(_tarefas.where((element) => element.getId == id).first);
  }

  Future<List<Tarefa>> getTarefas() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tarefas;
  }

  Future<List<Tarefa>> getTarefasNaoConcluidas() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tarefas.where((element) => element.getConcluido).toList();
  }

  void addTarefa(Tarefa value) {
    _tarefas.add(value);
  }
}
