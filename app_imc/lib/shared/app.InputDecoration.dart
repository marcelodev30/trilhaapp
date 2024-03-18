import 'package:flutter/material.dart';

class AppInputDecoration {
  static custonBorder(String labelText, String hintText) {
    return InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
  }
}
