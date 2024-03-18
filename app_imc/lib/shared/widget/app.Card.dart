// ignore_for_file: must_be_immutable
import 'package:app_imc/models/imc.model.dart';
import 'package:app_imc/service/tratamento_saidas.dart';
import 'package:app_imc/shared/app.TextStyle.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

class AppCard extends StatefulWidget {
  var model = ImcModels();
  AppCard({super.key, required this.model});

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.model.getImc.toStringAsFixed(2),
                style: AppTextStyle.text20),
            Text(saidas(widget.model.getImc), style: AppTextStyle.text18),
          ],
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${widget.model.getPeso}Kg', style: AppTextStyle.text20),
            Text(UtilData.obterDataDDMMAAAA(widget.model.getDate),
                style: AppTextStyle.text),
            const SizedBox(height: 5)
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${widget.model.getAltura}m', style: AppTextStyle.text18),
            Text(UtilData.obterHoraHHMM(widget.model.getDate),
                style: AppTextStyle.text15)
          ],
        ),
      ),
    );
  }
}
