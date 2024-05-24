import 'package:flutter/material.dart';
import 'package:imc/ui/page/imc.page.dart';
import 'package:imc/ui/shared/app_colors.dart';
import '../widgets/app_convex_appbar.dart';
import 'hist_imc.page.dart';

class HomePageIMC extends StatefulWidget {
  const HomePageIMC({super.key});

  @override
  State<HomePageIMC> createState() => _HomePageIMCState();
}

class _HomePageIMCState extends State<HomePageIMC>
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
        children: const [
          ImcPage(),
          HistIMCPage(),
        ],
      ),
      bottomNavigationBar: ConvexAppBarApp(
        controller: tabController,
        onTap: (int i) => tabController.index = i,
      ),
    );
  }
}
