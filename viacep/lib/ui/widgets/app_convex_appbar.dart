import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../shared/app.colors.dart';

class ConvexAppBarApp extends StatelessWidget {
  final TabController? controller;
  final void Function(int)? onTap;
  const ConvexAppBarApp({super.key, this.controller, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
        controller: controller,
        backgroundColor: AppColors.midnightBlue,
        color: AppColors.white,
        items: const [
          TabItem(icon: Icons.home, title: 'CEP'),
          TabItem(icon: Icons.history, title: 'Hist CEP'),
        ],
        onTap: onTap);
  }
}
