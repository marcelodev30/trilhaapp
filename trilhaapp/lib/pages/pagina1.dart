import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:trilhaapp/models/tarefa.dart';
import 'package:trilhaapp/repositories/tarefa_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var tarefaRepository = TarefaRespository();
  var descricaoContoller = TextEditingController();
  int aa = 0;
  // ignore: unused_field
  var _tarefas = const <Tarefa>[];

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    _tarefas = await tarefaRepository.getTarefas();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('App de tarefa')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCupertinoDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: const Text(
                    'Adicional tarefa',
                  ),
                  content: TextField(
                    controller: descricaoContoller,
                    decoration:
                        const InputDecoration(hintText: 'Digite uma tarefa'),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          descricaoContoller.clear();
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar')),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            tarefaRepository.addTarefa(
                                Tarefa(descricaoContoller.text, false));
                          });
                          descricaoContoller.clear();
                          Navigator.pop(context);
                        },
                        child: const Text('Salvar'))
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            SegmentedButton(
              segments: const [
                ButtonSegment(value: 0, label: Text('Todas')),
                ButtonSegment(value: 1, label: Text('Pendentes')),
                ButtonSegment(value: 2, label: Text('Concluídas')),
                ButtonSegment(value: 3, label: Text('Desativadas')),
              ],
              selected: {aa},
              onSelectionChanged: (p0) {},
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (_, index) {
                    return Dismissible(
                      background: Container(
                        color: Colors.red,
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      key: Key(_tarefas[index].getId),
                      onDismissed: (direction) async {
                        await tarefaRepository.remove(_tarefas[index].getId);
                        obterTarefas();
                      },
                      child: Card(
                          elevation: 6,
                          child: ListTile(
                            title: Text(_tarefas[index].getDescricao),
                            trailing: Tooltip(
                              message: _tarefas[index].getConcluido
                                  ? 'Ativa tarefa'
                                  : 'tarefa destivada',
                              child: Switch(
                                value: _tarefas[index].getConcluido,
                                onChanged: (value) async {
                                  await tarefaRepository.alterar(
                                      _tarefas[index].getId, value);
                                  obterTarefas();
                                },
                              ),
                            ),
                          )),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
