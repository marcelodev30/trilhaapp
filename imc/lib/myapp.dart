import 'package:flutter/material.dart';
import 'package:imc/core/app.route.dart';
import 'package:imc/ui/shared/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getRoutes,
    );
  }
}
