import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/conf/components/text_field_app.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuração Hive')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: const Column(
            children: [
              TextFieldMyApp(
                label: 'Nome',
                value: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
