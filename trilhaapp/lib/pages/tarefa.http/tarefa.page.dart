import 'package:flutter/material.dart';

import '../../models/tarefasb.model.dart';
import '../../repositories/back4app/tarefas.back.repository.dart';

class TarefasHttpPage extends StatefulWidget {
  const TarefasHttpPage({super.key});

  @override
  State<TarefasHttpPage> createState() => _TarefasHttpPageState();
}

class _TarefasHttpPageState extends State<TarefasHttpPage> {
  var repository = TarefasBack4appRepository();
  var _tarefas = TarafaModelBack4app([]);
  bool isloading = false;
  var _fromTarefaController = TextEditingController();
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    setState(() {
      isloading = true;
    });
    _tarefas = await repository.get();
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas HTTP'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
        child: isloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                    itemCount: _tarefas.tarefas.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(_tarefas.tarefas[index].descricao),
                        onDismissed: (direction) async {
                          await repository
                              .delete(_tarefas.tarefas[index].objectId);
                          setState(() {
                            carregarDados();
                          });
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
                                          controller: _fromTarefaController,
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Sair')),
                                          TextButton(
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                _tarefas.tarefas[index]
                                                        .descricao =
                                                    _fromTarefaController.text;
                                                await repository.update(
                                                    _tarefas.tarefas[index]);
                                                _fromTarefaController.clear();
                                                setState(() {
                                                  carregarDados();
                                                });
                                              },
                                              child: const Text('Salvar'))
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text(_tarefas.tarefas[index].descricao)),
                            trailing: Switch(
                              value: _tarefas.tarefas[index].concluido,
                              onChanged: (value) async {
                                _tarefas.tarefas[index].concluido = value;
                                await repository
                                    .update(_tarefas.tarefas[index]);
                                setState(() {
                                  carregarDados();
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ))
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Adicional tarefa'),
                content: TextField(
                  controller: _fromTarefaController,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Sair')),
                  TextButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        await repository.save(TarefaModel.save(
                            _fromTarefaController.text, false));
                        _fromTarefaController.clear();
                        setState(() {
                          carregarDados();
                        });
                      },
                      child: const Text('Salvar'))
                ],
              );
            },
          );
        },
      ),
    );
  }
}
