import 'package:flutter/material.dart';

import 'package:trilhaapp/repositories/via_cep.repository.dart';

import '../models/viacep.model.dart';

class ConsultaCep extends StatefulWidget {
  const ConsultaCep({super.key});

  @override
  State<ConsultaCep> createState() => _ConsultaCepState();
}

class _ConsultaCepState extends State<ConsultaCep> {
  final _valueTexController = TextEditingController();

  bool loading = false;
  var viacepmodel = ViaCepModel();
  var viaceprepository = ViaCepRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('My App')),
      body: Container(
        margin: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          const Text(
            'Consulta de CEP',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          TextField(
            controller: _valueTexController,
            keyboardType: TextInputType.number,
            maxLength: 8,
            onChanged: (value) {
              var cep = value.replaceAll(RegExp(r'[0-9]'), '');
              if (cep.length == 8) {
              } else {}
            },
          ),
          const SizedBox(height: 30),
          loading
              ? const CircularProgressIndicator()
              : Text(
                  '${viacepmodel.localidade ?? ''} - ${viacepmodel.uf ?? ''}',
                  style: const TextStyle(fontSize: 30),
                )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var cep = _valueTexController.text.replaceAll(RegExp('r[0-9]'), '');
          if (cep.length == 8) {
            setState(() {
              loading = true;
            });

            viacepmodel = await viaceprepository.getCep(cep);

            setState(() {
              loading = false;
            });
          }
          setState(() {});
        },
        child: const Icon(Icons.satellite_alt),
      ),
    );
  }
}
