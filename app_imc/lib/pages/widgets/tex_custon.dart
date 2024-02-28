import 'package:flutter/material.dart';

class TextCuston extends StatelessWidget {
  final String texto;
  const TextCuston({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(texto,
          style: const TextStyle(
              fontSize: 35, fontWeight: FontWeight.w700, color: Colors.white)),
    );
  }
}
