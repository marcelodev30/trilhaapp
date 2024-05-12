import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldMyApp extends StatelessWidget {
  final String label;
  final String value;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  const TextFieldMyApp(
      {super.key,
      required this.label,
      required this.value,
      this.validator,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      validator: validator,
      inputFormatters: inputFormatters,
      decoration:
          InputDecoration(labelText: label, border: const OutlineInputBorder()),
    );
  }
}
