import 'package:flutter/material.dart';
import 'package:viacep/ui/page/my_cep.page.dart';
import 'package:viacep/ui/page/viacep.page.dart';
import 'package:viacep/ui/shared/app.colors.dart';

import '../widgets/app_convex_appbar.dart';

class HomePageCep extends StatefulWidget {
  const HomePageCep({super.key});

  @override
  State<HomePageCep> createState() => _HomePageCepState();
}

class _HomePageCepState extends State<HomePageCep>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sapphireBlue,
      body: TabBarView(
        controller: tabController,
        children: const [ViaCepPage(), MyCepPage()],
      ),
      bottomNavigationBar: ConvexAppBarApp(
        controller: tabController,
        onTap: (p0) => tabController.index = p0,
      ),
    );
  }
}
