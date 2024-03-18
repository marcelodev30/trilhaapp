import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:imc/pages/imc.calcule.page.dart';
import 'package:imc/shared/app.colors.dart';
import 'imc.history.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [ImcPage(), ImcPage2()],
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: AppColor.sapphireBlue,
        style: TabStyle.react,
        items: const [
          TabItem(icon: Icons.house),
          TabItem(icon: Icons.history),
        ],
        initialActiveIndex: 0,
        onTap: (int i) => _pageController.jumpToPage(i),
      ),
    );
  }
}
