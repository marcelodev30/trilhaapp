import 'package:flutter/material.dart';
import 'package:imc/data/models/imc_models.dart';
import 'package:imc/data/repositories/imc_repository.dart';
import 'package:imc/ui/shared/app_colors.dart';
import 'package:imc/ui/shared/app_textstyle.dart';
import '../widgets/app_container.dart';

class HistIMCPage extends StatefulWidget {
  const HistIMCPage({super.key});

  @override
  State<HistIMCPage> createState() => _HistIMCPageState();
}

class _HistIMCPageState extends State<HistIMCPage> {
  final repository = ImcRepository();
  List<ImcModels> imc = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    imc = await repository.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 30),
        Text(
          'Historico',
          style: AppTextStyle.style60W700White,
        ),
        DesignContainerPage(
          heightP: 0.65,
          widgets: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
            child: ListView.builder(
              itemCount: imc.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Card(
                      //margin: const EdgeInsets.all(10),
                      elevation: 8,
                      color: AppColors.funGreen,
                      child: ListTile(
                          leading: Text2App(text: 'Imc', value: imc[index].imc),
                          title: Text2App(
                              text: 'Altura', value: imc[index].altura),
                          trailing: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child:
                                Text2App(text: 'Peso', value: imc[index].peso),
                          ),
                          horizontalTitleGap: 50),
                    ),
                    Positioned(
                        top: -10,
                        right: 16,
                        child: SizedBox(
                          height: 60,
                          width: 20,
                          child: GestureDetector(
                            onTap: () async {
                              repository.delete(imc[index].id);
                              loadData();
                            },
                            child: Icon(
                              Icons.highlight_remove,
                              color: AppColors.white,
                              size: 30,
                            ),
                          ),
                        ))
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

class Text2App extends StatelessWidget {
  final String text;
  final double value;

  const Text2App({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: AppTextStyle.newTest01(20),
          ),
          Text(
            value.toString(),
            style: AppTextStyle.newTest01(16),
          ),
        ]);
  }
}
