import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';
//import 'package:imc/data/repositories/imc_repository.dart';
import '../../data/models/imc_models.dart';
import '../../data/repositories/imc_repository.dart';
import '../controllers/imc_controller.dart';
import '../shared/app_textstyle.dart';
import '../widgets/app_Container.dart';
import '../widgets/app_button.dart';
import '../widgets/app_textfield.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final fromKey = GlobalKey<FormState>();
  ImcModels modesImc = ImcModels.empty();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 50),
              Text('IMC', style: AppTextStyle.style30W700White),
              Text(modesImc.imc.toString(),
                  style: AppTextStyle.style100W700White),
              Text(modesImc.resultado, style: AppTextStyle.style25W600White),
            ],
          ),
          DesignContainerPage(
            heightP: 0.45,
            widgets: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: fromKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Calculadora IMC',
                        style: AppTextStyle.style40W700Black),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        TextFieldApp(
                          labelText: 'Altura',
                          onSaved: (value) => modesImc.altura =
                              double.parse(value!.replaceAll(',', '.')),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            AlturaInputFormatter(),
                          ],
                        ),
                        const SizedBox(width: 10),
                        TextFieldApp(
                            labelText: 'Peso',
                            onSaved: (value) => modesImc.peso =
                                double.parse(value!.replaceAll(',', '.')),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              PesoInputFormatter()
                            ])
                      ],
                    ),
                    const SizedBox(height: 30),
                    ButtonApp(
                      labelText: 'Calcular IMC',
                      onPressed: () {
                        if (fromKey.currentState!.validate()) {
                          fromKey.currentState!.save();
                          ImcController.calcularIMC(modesImc);
                          ImcRepository.save(modesImc);
                          setState(() {});
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
