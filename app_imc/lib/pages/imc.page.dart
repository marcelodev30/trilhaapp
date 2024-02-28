import 'package:flutter/material.dart';

import '../models/imc.model.dart';
import '../repositories/imc.repository.dart';
import 'widgets/tex_custon.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  bool e = false;
  final _fromKey = GlobalKey<FormState>();
  final model = ImcModels();
  final respository = ImcResponsitory();
  var lista = <ImcModels>[];
  @override
  void initState() {
    super.initState();
    respository.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: Colors.indigo[600],
      body: SafeArea(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            //padding: const EdgeInsets.all(8),
            child: PageView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      const SizedBox(height: 50),
                      const Text('IMC',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      Text(model.imc.toStringAsFixed(2),
                          style: const TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      Text(model.descricao,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ]),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.elliptical(50, 50))),
                      child: Form(
                          key: _fromKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 135),
                              const Text(
                                'Calculadora IMC',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                  Expanded(
                                      child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        hintText: 'Ex 1.80 ',
                                        labelText: 'Altura',
                                        border: OutlineInputBorder()),
                                    validator: (value) =>
                                        value!.isEmpty ? 'Invalido' : null,
                                    onSaved: (newValue) => model.altura =
                                        double.parse(newValue.toString()),
                                  )),
                                  const SizedBox(width: 20),
                                  Expanded(
                                      child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        hintText: 'Ex 75',
                                        labelText: 'Peso',
                                        border: OutlineInputBorder()),
                                    validator: (value) =>
                                        value!.isEmpty ? 'Invalido' : null,
                                    onSaved: (newValue) => model.peso =
                                        double.parse(newValue.toString()),
                                  )),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.65,
                                height: 55,
                                child: TextButton(
                                  onPressed: () {
                                    if (_fromKey.currentState!.validate()) {
                                      _fromKey.currentState!.save();
                                      setState(() {
                                        model.imc = model.peso /
                                            (model.altura * model.altura);
                                        model.descricao =
                                            respository.saidas(model.imc);
                                        respository.add(model);
                                      });
                                    }
                                  },
                                  // ignore: sort_child_properties_last
                                  child: const Text(
                                    'Calcular IMC',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                  style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Colors.indigo)),
                                ),
                              )
                            ],
                          )),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      const SizedBox(height: 50),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 25),
                          Text('Olá, bem vindo! ',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                        ],
                      ),
                      Text(model.nome,
                          style: const TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      Text(model.descricao,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ]),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.5,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.elliptical(50, 50))),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            Expanded(
                                child: ListView.builder(
                              itemCount: respository.getImcs.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 100,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Card(
                                    color: Colors.green,
                                    elevation: 7,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        TextCuston(
                                            texto: respository
                                                .getImcs[index].imc
                                                .toStringAsFixed(2)),
                                        TextCuston(
                                            texto:
                                                '${respository.getImcs[index].peso}Kg'),
                                        TextCuston(
                                            texto: respository
                                                .getImcs[index].altura
                                                .toString()),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ))
                          ],
                        )),
                  ],
                ),
              ],
            )),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_sharp),
            label: 'IMC',
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'Historico',
          ),
        ],
      ),
    );
  }
}

var test = Text(
    // respository.getImcs[index].descricao
    2.toString().replaceAll('Peso Normal', 'Normal'),
    style: const TextStyle(
        fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white));
