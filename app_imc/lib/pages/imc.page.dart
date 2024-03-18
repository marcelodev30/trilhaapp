import 'package:app_imc/shared/app.TextStyle.dart';
import 'package:app_imc/shared/app.boxDecoration.dart';
import 'package:app_imc/shared/app.colors.dart';
import 'package:app_imc/shared/widget/app.Card.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/imc.model.dart';
import '../repositories/imc.repository.dart';
import '../shared/app.ButtonStyle.dart';
import '../shared/app.InputDecoration.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final _pageController = PageController();
  final _fromKey = GlobalKey<FormState>();
  var model = ImcModels();
  final respository = ImcResponsitory();
  var lista = <ImcModels>[];
  var valorIMC = 22.60;

  @override
  void initState() {
    super.initState();
    lista = respository.getImcs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.sapphireBlue,
      body: SafeArea(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              //padding: const EdgeInsets.all(8),
              child: PageView(controller: _pageController, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      const SizedBox(height: 50),
                      Text('IMC', style: AppTextStyle.text35),
                      Text(valorIMC.toStringAsFixed(2),
                          style: AppTextStyle.textBig100),
                      Text(respository.saidas(valorIMC),
                          style: AppTextStyle.text25),
                    ]),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.5,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        decoration: AppBoxDecoration.borderRadius50,
                        child: Form(
                            key: _fromKey,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Calculadora IMC',
                                      style: AppTextStyle.text40Black),
                                  const SizedBox(height: 30),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          AlturaInputFormatter(),
                                        ],
                                        decoration:
                                            AppInputDecoration.custonBorder(
                                                'Altura', 'Ex 1.80 '),
                                        validator: (value) =>
                                            value!.isEmpty ? 'Invalido' : null,
                                        onSaved: (newValue) => model.altura =
                                            double.parse(
                                                newValue!.replaceAll(',', '.')),
                                      )),
                                      const SizedBox(width: 20),
                                      Expanded(
                                          child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          PesoInputFormatter()
                                        ],
                                        decoration:
                                            AppInputDecoration.custonBorder(
                                                'Peso', 'Ex 75 '),
                                        validator: (value) =>
                                            value!.isEmpty ? 'Invalido' : null,
                                        onSaved: (newValue) => model.peso =
                                            double.parse(
                                                newValue!.replaceAll(',', '.')),
                                      )),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.65,
                                      height: 55,
                                      child: TextButton(
                                          onPressed: () {
                                            if (_fromKey.currentState!
                                                .validate()) {
                                              _fromKey.currentState!.save();
                                              model.imc = model.peso /
                                                  (model.altura * model.altura);
                                              model.descricao =
                                                  respository.saidas(model.imc);
                                              model.setDate = DateTime.now();
                                              respository.add(model);
                                              valorIMC = model.imc;
                                              model = ImcModels();
                                              setState(() {});
                                            }
                                          },
                                          style: AppButtonStyle.custon,
                                          child: Text(
                                            'Calcular IMC',
                                            style: AppTextStyle.text25,
                                          )))
                                ])))
                  ],
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 20),
                      Text('Historico', style: AppTextStyle.text35),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.7,
                          decoration: AppBoxDecoration.borderRadius50,
                          child: ListView.builder(
                              itemCount: lista.length,
                              itemBuilder: (context, index) {
                                return AppCard(model: lista[index]);
                              }))
                    ])
              ]))),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: AppColor.sapphireBlue,
        style: TabStyle.react,
        items: const [
          TabItem(icon: Icons.house),
          TabItem(icon: Icons.history),
        ],
        initialActiveIndex: 0,
        onTap: (int i) => _pageController.jumpToPage(i),
      ),
    );
  }
}
