import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityPlusPage extends StatefulWidget {
  const ConnectivityPlusPage({super.key});

  @override
  State<ConnectivityPlusPage> createState() => _ConnectivityPlusPageState();
}

class _ConnectivityPlusPageState extends State<ConnectivityPlusPage> {
  late StreamSubscription subscription;
  String tipo = '';
  @override
  void initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen((event) {
      debugPrint(event.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectivity Plus '),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(tipo),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () async {
                  final connectivityResult =
                      await (Connectivity().checkConnectivity());

                  debugPrint(connectivityResult.toString());
                  if (connectivityResult == ConnectivityResult.mobile) {
                    tipo = 'Movel';
                  } else if (connectivityResult == ConnectivityResult.wifi) {
                    tipo = 'Wifi';
                  }
                  setState(() {});
                },
                child: const Text('Verificar conexao'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
