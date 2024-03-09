import 'package:flutter/material.dart';
import 'package:flutter_app/page/home.page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 27, 51, 100),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
            titleTextStyle: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold)
          )),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}
