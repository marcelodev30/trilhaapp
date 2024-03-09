import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/new app/repository/tarefa_repository.dart';
import 'pages/splash_sreen.page.dart';
import 'service/contador_service.dart';
import 'service/dark_mode_servide.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkModeService>(
            create: (_) => DarkModeService()),
        ChangeNotifierProvider<ContadorService>(
            create: (_) => ContadorService()),
        ChangeNotifierProvider<TarefaRepository>(
            create: (context) => TarefaRepository())
      ],
      child: Consumer<DarkModeService>(builder: (_, status, w) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: status.getDarkmode ? ThemeData.dark() : themadata,
          home: const SplashSreenPage(),
        );
      }),
    );
  }
}

var themadata = ThemeData(
  appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      color: Colors.red,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
  primarySwatch: Colors.red,
);
