import 'package:flutter/material.dart';
import 'package:imc/ui/shared/app_colors.dart';

class ButtonApp extends StatelessWidget {
  final void Function()? onPressed;
  final String labelText;
  const ButtonApp({super.key, required this.labelText,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 55,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColors.sapphireBlue)),
        child: Text(
          labelText,
          style: TextStyle(
              color: AppColors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
