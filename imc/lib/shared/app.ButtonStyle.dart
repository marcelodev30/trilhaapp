import 'package:flutter/material.dart';
import 'package:imc/shared/app.colors.dart';

class AppButtonStyle {
  static get custon => ButtonStyle(
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      backgroundColor:  MaterialStatePropertyAll(AppColor.midnightBlue));
}
