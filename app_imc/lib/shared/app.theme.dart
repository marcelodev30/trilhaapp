import 'package:flutter/material.dart';

import 'app.colors.dart';

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
        appBarTheme: const AppBarTheme(
            color: Colors.transparent, elevation: 0, centerTitle: true),
        colorScheme: ColorScheme.light(
          background: AppColor.sapphireBlue,
        ));
  }
}
