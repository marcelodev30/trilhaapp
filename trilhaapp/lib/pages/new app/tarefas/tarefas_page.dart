import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trilhaapp/pages/new%20app/tarefas/tarefa.mode.dart';

import '../repository/tarefa_repository.dart';

// ignore: must_be_immutable
class TarefasPage extends StatelessWidget {
  var descricaoContoller = TextEditingController();
  final repository = TarefaRepository();

  TarefasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TarefaRepository>(builder: (_, tarefas, w) {
        return ListView.builder(
            itemCount: tarefas.getTarefa.length,
            itemBuilder: (_, index) {
              var tarefa = tarefas.getTarefa[index];
              return Dismissible(
                key: Key(tarefa.descricao),
                onDismissed: (direction) {
                  tarefas.remove(tarefa.id);
                },
                background: Container(
                  color: Colors.red,
                ),
                child: Card(
                  elevation: 7,
                  shape: const OutlineInputBorder(),
                  child: ListTile(
                    title: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Atualiza tarefa'),
                                content: TextField(
                                  controller: descricaoContoller,
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Sair')),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        tarefas.alterar(
                                            descricaoContoller.text, true);
                                        descricaoContoller.clear();
                                      },
                                      child: const Text('Salvar'))
                                ],
                              );
                            },
                          );
                        },
                        child: Text(tarefa.descricao)),
                    trailing: Switch(
                      value: tarefa.concluido,
                      onChanged: (value) {
                        tarefa.concluido = value;
                        tarefas.alterar(tarefa.descricao, tarefa.concluido);
                      },
                    ),
                  ),
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
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
                          Navigator.pop(context);
                          Provider.of<TarefaRepository>(context, listen: false)
                              .adicionar(TarefaModelV2(
                                  descricaoContoller.text, false));
                        },
                        child: const Text('Salvar'))
                  ],
                );
              });
        },
      ),
    );
  }
}
