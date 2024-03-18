import 'package:flutter/material.dart';
import 'package:imc/shared/app.theme.dart';
import 'package:provider/provider.dart';

import 'pages/home.pege.dart';
import 'repositories/imc.repository.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ImcRepositort()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      home: const HomePage(),
    );
  }
}
