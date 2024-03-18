import 'package:flutter/material.dart';
import 'app.colors.dart';

class AppBoxDecoration {
  static get borderRadius50 {
    return BoxDecoration(
        color: AppColor.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.elliptical(50, 50),
            topRight: Radius.elliptical(50, 50)));
  }
}
