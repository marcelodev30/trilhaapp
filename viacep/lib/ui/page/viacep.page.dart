import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viacep/data/models/cep.back4app.model.dart';
import 'package:viacep/data/repositories/cep.repository.dart';
import 'package:viacep/ui/shared/app.colors.dart';

import '../widgets/app_card.dart';

class ViaCepPage extends StatefulWidget {
  const ViaCepPage({super.key});

  @override
  State<ViaCepPage> createState() => _ViaCepPageState();
}

class _ViaCepPageState extends State<ViaCepPage> {
  var modelCep = CepModel();
  final repositoryCep = CepRepository();
  final _TexCepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.sapphireBlue,
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
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CepInputFormatter(),
                      ],
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintStyle: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          hintText: 'Ex: 00000-000',
                          suffixIcon: GestureDetector(
                              onTap: () async {
                                modelCep = await repositoryCep.getCep(
                                    _TexCepController.text.replaceAll('.', ''));
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
            height: MediaQuery.of(context).size.height * 0.5,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(topLeft: Radius.elliptical(60, 60)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                CardApp(
                  modelCep: modelCep,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
