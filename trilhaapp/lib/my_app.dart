import 'package:flutter/material.dart';
import 'pages/splash_sreen.page.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.red),
        primarySwatch: Colors.red,
        //textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: const SplashSreenPage(),
    );
  }
}
