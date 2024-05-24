import 'package:flutter/material.dart';

import '../ui/page/design_home.page.dart';

class AppRoutes {
  static String get initialRoute => '/';

  static Map<String, Widget Function(BuildContext)> getRoutes = {
    '/': (context) => const HomePageIMC()
  };
}
