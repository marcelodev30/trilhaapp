import 'package:flutter/material.dart';
import 'package:imc/models/models.dart';
import 'package:imc/shared/app.TextStyle.dart';
import 'package:imc/shared/app.boxDecoration.dart';
import '../repositories/imc.repository.dart';
import '../shared/widget/app.Card.dart';

class ImcPage2 extends StatefulWidget {
  const ImcPage2({super.key});

  @override
  State<ImcPage2> createState() => _ImcPage2State();
}

class _ImcPage2State extends State<ImcPage2> {
  final repository = ImcRepositort();
  var list = <ImcModels>[];

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() {
    list = repository.getListaIMC;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 40),
        Text(
          'History',
          style: AppTextStyle.text35,
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.70,
            decoration: AppBoxDecoration.borderRadius50,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return AppCard(model: list[index]);
              },
            ))
      ],
    );
  }
}
