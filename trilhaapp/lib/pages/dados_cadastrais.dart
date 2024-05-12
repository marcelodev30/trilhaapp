import 'package:flutter/material.dart';

import '../repositories/linguagens_repository.dart';
import '../repositories/nivel_repositorios.dart';
import '../shared/widgets/text_label.dart';

class MyDados extends StatefulWidget {
  final String texto;
  const MyDados({super.key, required this.texto});

  @override
  State<MyDados> createState() => _MyDadosState();
}

class _MyDadosState extends State<MyDados> {
  var nomeController = TextEditingController(text: '');
  var dataNacimentoControlle = TextEditingController(text: '');
  DateTime? dataNacimento;
  var niveis = [];
  var linguagens = [];
  var linguagensSelecionado = [];
  var nivelSelecionado = '';
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;
  @override
  void initState() {
    niveis = NivelRepository().getNiveis();
    linguagens = LinguansRepository().getLinguagens();
    super.initState();
  }

  List<DropdownMenuItem> getItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(
        // ignore: sort_child_properties_last
        child: Text(i.toString()),
        value: i,
      ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.texto)),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListView(
            children: [
              const TextLabel(
                texto: 'Nome',
              ),
              TextField(
                controller: nomeController,
                inputFormatters: const [],
              ),
              const TextLabel(
                texto: 'Data de nascimento',
              ),
              TextField(
                readOnly: true,
                controller: dataNacimentoControlle,
                onTap: () async {
                  var data = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900, 5, 1),
                      lastDate: DateTime(2030, 12, 31));
                  if (data != null) {
                    dataNacimentoControlle.text = data.toString();
                    dataNacimento = data;
                  }
                },
                decoration:
                    InputDecoration(hintText: dataNacimentoControlle.text),
              ),
              const TextLabel(texto: 'Nivel de experiencias'),
              Column(
                children: niveis
                    .map((item) => RadioListTile(
                        selected: nivelSelecionado == item, //Color
                        value: item.toString(),
                        title: Text(item.toString()),
                        groupValue: nivelSelecionado,
                        onChanged: (value) {
                          setState(() {
                            nivelSelecionado = value.toString();
                          });
                          debugPrint(value);
                        }))
                    .toList(),
              ),
              const SizedBox(height: 5),
              const TextLabel(texto: 'Linguagens preferidas'),
              Column(
                children: linguagens
                    .map((e) => CheckboxListTile(
                        contentPadding: const EdgeInsets.all(-5),
                        title: Text(e.toString()),
                        value: linguagensSelecionado.contains(e),
                        onChanged: (bool? value) {
                          if (value!) {
                            linguagensSelecionado.add(e);
                          } else {
                            linguagensSelecionado.remove(e);
                          }
                          setState(() {});
                        }))
                    .toList(),
              ),
              //Text(linguagensSelecionado.toString()),
              DropdownButton(
                isExpanded: true,
                value: tempoExperiencia,
                items: getItens(50),
                onChanged: (value) {
                  setState(() {
                    tempoExperiencia = int.parse(value.toString());
                  });
                },
              ),
              TextLabel(
                  texto: 'Protenção Salarial R\$: ${salarioEscolhido.toInt()}'),
              Slider(
                  min: 0,
                  max: 12500,
                  value: salarioEscolhido,
                  onChanged: (value) {
                    setState(() {
                      salarioEscolhido = value;
                    });
                  }),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                width: double.infinity,
                height: 40,
                child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 15, 18, 206))),
                    onPressed: () {
                      debugPrint(nomeController.text);
                    },
                    child: const Text('Salva')),
              )
            ],
          ),
        ));
  }
}
