import 'package:flutter/material.dart';
import '../shared/app_colors.dart';

class DesignContainerPage extends StatelessWidget {
  final double heightP;
  final Widget widgets;
  const DesignContainerPage(
      {super.key, required this.heightP, required this.widgets});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * heightP,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius:
              const BorderRadius.only(topLeft: Radius.elliptical(50, 50))),
      child: widgets,
    );
  }
}
