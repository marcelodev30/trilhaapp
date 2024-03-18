import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/models.dart';
import '../repositories/imc.repository.dart';
import '../service/calcular.dart';
import '../service/tratamento_saidas.dart';
import '../shared/app.ButtonStyle.dart';
import '../shared/app.InputDecoration.dart';
import '../shared/app.TextStyle.dart';
import '../shared/app.boxDecoration.dart';
import 'package:brasil_fields/brasil_fields.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  var model = ImcModels();
  final _fromKey = GlobalKey<FormState>();
  var repository = ImcRepositort();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text('IMC', style: AppTextStyle.text35),
              Text(model.getImc.toString(), style: AppTextStyle.textBig100),
              Text(saidas(model.getImc), style: AppTextStyle.text25),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.50,
          decoration: AppBoxDecoration.borderRadius50,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Form(
                key: _fromKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Calculadora IMC', style: AppTextStyle.text40Black),
                    const SizedBox(height: 30),
                    Row(children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            AlturaInputFormatter(),
                          ],
                          decoration: AppInputDecoration.custonBorder(
                              'Alura', 'Ex: 1,80'),
                          validator: (value) => value!.isEmpty ? '' : null,
                          onSaved: (newValue) => model.setAltura =
                              double.parse(newValue!.replaceAll(',', '.')),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              PesoInputFormatter()
                            ],
                            decoration: AppInputDecoration.custonBorder(
                                'Peso', 'Ex: 70'),
                            validator: (value) => value!.isEmpty ? '' : null,
                            onSaved: (newValue) => model.setPeso =
                                double.parse(newValue!.replaceAll(',', '.'))),
                      )
                    ]),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      height: 55,
                      child: TextButton(
                        onPressed: () {
                          if (_fromKey.currentState!.validate()) {
                            _fromKey.currentState!.save();
                          }
                          model.setImc =
                              Calcular.imc(model.getPeso, model.getAltura);
                          repository.setAddList(model);
                          setState(() {});
                        },
                        style: AppButtonStyle.custon,
                        child: Text(
                          'Calcular IMC',
                          style: AppTextStyle.text25,
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
