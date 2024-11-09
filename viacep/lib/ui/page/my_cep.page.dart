import 'package:flutter/material.dart';
import 'package:viacep/data/models/cep.back4app.model.dart';
import 'package:viacep/ui/widgets/app_card.dart';

import '../../data/repositories/cep.repository.dart';
import '../widgets/app_container.dart';

class MyCepPage extends StatefulWidget {
  const MyCepPage({super.key});

  @override
  State<MyCepPage> createState() => _MyCepPageState();
}

class _MyCepPageState extends State<MyCepPage> {
  CepRepository cepRepository = CepRepository();
  List<CepModel> cep = [];

  @override
  void initState() {
    super.initState();
    carregaCep();
  }

  carregaCep() async {
    cep = await cepRepository.findcepAll();
    setState(() {});
  }

//58709-970
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('My Cep'),
        DesignContainerPage(
            heightP: 0.70,
            widgets: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: cep.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: CardApp(
                      modelCep: cep[index],
                      isremove: true,
                      buttonRemove: () {
                        cepRepository.delete(cep[index].objectId!);
                        setState(() {});
                      },
                    ),
                  );
                },
              ),
            ))
      ],
    );
  }
}
