import 'package:flutter/material.dart';
import 'package:imc/ui/shared/app_colors.dart';


class AppTheme{
  static ThemeData get themeData => ThemeData(
        appBarTheme: AppBarTheme(
      centerTitle: true,
      color: AppColors.transparent,
      elevation: 0,
    ));

}


