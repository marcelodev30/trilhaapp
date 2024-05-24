import 'package:flutter/material.dart';
import 'package:imc/ui/shared/app_colors.dart';

class AppTextStyle {
  static TextStyle get style30W700White => TextStyle(
      color: AppColors.white, fontSize: 30, fontWeight: FontWeight.w700);
  static TextStyle get style25W600White => TextStyle(
      color: AppColors.white, fontSize: 25, fontWeight: FontWeight.w600);
  static TextStyle get style100W700White => TextStyle(
      color: AppColors.white, fontSize: 100, fontWeight: FontWeight.w700);
  static TextStyle get style60W700White => TextStyle(
      color: AppColors.white, fontSize: 60, fontWeight: FontWeight.w700);
  static TextStyle get style40W700Black => TextStyle(
      color: AppColors.black, fontSize: 40, fontWeight: FontWeight.w700);

  static TextStyle newTest01(double size) {
    return TextStyle(
        color: AppColors.white, fontSize: size, fontWeight: FontWeight.w600);
  }
}
