import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldApp extends StatelessWidget {
  final String labelText;
  final void Function(String? value)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  const TextFieldApp({
    required this.labelText,
    this.inputFormatters,
    this.onSaved,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        keyboardType: TextInputType.number,
        onSaved: onSaved,
        validator: (value) =>
            value!.isEmpty ? 'Valor inválido' : null,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
