import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../service/contador_service.dart';

class ContadorPage extends StatefulWidget {
  const ContadorPage({super.key});

  @override
  State<ContadorPage> createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 51, 100),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ContadorService>(builder: (_, status, widget) {
              return Text(
                status.getContador.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 40),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Provider.of<ContadorService>(context, listen: false)
                  .incrementar();
            },
            backgroundColor: Colors.white,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              Provider.of<ContadorService>(context, listen: false).diminui();
            },
            backgroundColor: Colors.white,
            child: const Text(
              '-',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
