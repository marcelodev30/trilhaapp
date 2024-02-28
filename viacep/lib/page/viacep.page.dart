import 'package:flutter/material.dart';
import 'package:viacep/models/cep.back4app.model.dart';
import 'package:viacep/repositories/viacep.repository.dart';

class ViaCepPage extends StatefulWidget {
  const ViaCepPage({super.key});

  @override
  State<ViaCepPage> createState() => _ViaCepPageState();
}

class _ViaCepPageState extends State<ViaCepPage> {
  var modelCep = CepModel();
  final repositoryCep = ViaCepRepository();
  final _TexCepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Container(
        color: Colors.indigo,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: Column(
                children: [
                  const SizedBox(height: 110),
                  const Text(
                    'Busca CEP',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                          child: TextField(
                        controller: _TexCepController,
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintStyle: const TextStyle(
                                color: Colors.white, fontSize: 20),
                            hintText: 'Ex: 00000-000',
                            suffixIcon: GestureDetector(
                                onTap: () async {
                                  modelCep = await repositoryCep
                                      .getCep(_TexCepController.text);
                                  setState(() {});
                                },
                                child: const Icon(Icons.search)),
                            suffixIconColor: Colors.white),
                      )),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(topLeft: Radius.elliptical(60, 60)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          children: [
                            TextCuston(
                              titulo: 'Cep:',
                              value: modelCep.cep,
                            ),
                            const Divider(color: Colors.black),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 2),
                              child: Row(children: [
                                const Text('Localidade:',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(width: 10),
                                Text(
                                    "${modelCep.localidade ?? 'Sem Registo'} ${modelCep.uf ?? ''}",
                                    style: const TextStyle(fontSize: 25)),
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
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextCuston extends StatelessWidget {
  String? titulo;
  String? value;
  TextCuston({super.key, this.titulo, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      child: Row(children: [
        Text(titulo!,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
        const SizedBox(width: 10),
        Text(value ?? 'Sem Registo', style: const TextStyle(fontSize: 25)),
      ]),
    );
  }
}
