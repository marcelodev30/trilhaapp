import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextCuston extends StatelessWidget {
  String? titulo;
  String? value;
  TextCuston({super.key, this.titulo, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      child: Row(children: [
        Text(titulo!,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
        const SizedBox(width: 10),
        Text(value ?? 'Sem Registo', style: const TextStyle(fontSize: 18)),
      ]),
    );
  }
}
