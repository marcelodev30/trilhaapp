import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:trilhaapp/service/gerar_numeros.dart';

class NumeroAHive extends StatefulWidget {
  const NumeroAHive({super.key});

  @override
  State<NumeroAHive> createState() => _NumeroAHiveState();
}

class _NumeroAHiveState extends State<NumeroAHive> {
  int numero = 0;
  int count = 0;
  late Box stroge;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    stroge = await Hive.openBox('boxdados');
    numero = stroge.get('numero') ?? 0;
    count = stroge.get('count') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hive')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(numero.toString()),
            Text(count.toString()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          numero = gerarNumeroAleatorio(999);
          stroge.put('numero', numero);
          count++;
          stroge.put('count', count);
          carregarDados();
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
