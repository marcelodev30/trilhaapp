import 'dart:js';

import 'package:flutter/material.dart';
import 'package:viacep/ui/widgets/app_text_custon.dart';

import '../../data/models/cep.back4app.model.dart';

class CardApp extends StatelessWidget {
  final CepModel modelCep;

  void Function()? buttonRemove;
  void Function()? buttonEdit;
  bool isremove;
  CardApp(
      {super.key,
      required this.modelCep,
      this.isremove = false,
      this.buttonRemove,
      this.buttonEdit});

  @override
  Widget build(BuildContext context) {
    bool isEdit = false;
    return Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCuston(
                    titulo: 'Cep:',
                    value: modelCep.cep,
                  ),
                  Expanded(child: Container()),
                  isremove
                      ? TextButton(
                          onPressed: () {}, child: const Icon(Icons.edit))
                      : Container(),
                  isremove
                      ? TextButton(
                          onPressed: buttonRemove,
                          child: const Icon(Icons.delete))
                      : Container(),
                ],
              ),
              const Divider(color: Colors.black),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                child: Row(children: [
                  const Text('Localidade:',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
                  const SizedBox(width: 10),
                  modelCep.localidade != null
                      ? Text("${modelCep.localidade} ${modelCep.uf}",
                          style: const TextStyle(fontSize: 25))
                      : const Text(
                          'Sem Registo',
                          style: TextStyle(fontSize: 20),
                        ),
                ]),
              ),
              const Divider(color: Colors.black),
              TextCuston(
                titulo: 'Logradouro:',
                value: modelCep.logradouro,
              ),
              const Divider(color: Colors.black),
              TextCuston(
                titulo: 'Complemento:',
                value: modelCep.complemento,
              ),
              const Divider(color: Colors.black),
              TextCuston(
                titulo: 'Bairro:',
                value: modelCep.bairro,
              ),
              const SizedBox(height: 10)
            ],
          ),
        ));
  }
}
