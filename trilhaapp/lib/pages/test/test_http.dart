import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpTestPage extends StatefulWidget {
  const HttpTestPage({super.key});

  @override
  State<HttpTestPage> createState() => _HttpTestPageState();
}

class _HttpTestPageState extends State<HttpTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.satellite_alt_sharp),
        onPressed: () async {
          var response =
              await http.get(Uri.parse('http://127.0.0.1:8000/dados/pedidos'));
          print(response.body);
        },
      ),
    );
  }
}
