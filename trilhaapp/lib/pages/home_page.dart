import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/consuta_cep.dart';
import 'package:trilhaapp/pages/pagina1.dart';
import 'package:trilhaapp/pages/test/pagina2.dart';
import 'package:trilhaapp/shared/widgets/custon_drawer.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      drawer: DrawerCuston(),
      appBar: AppBar(title: const Text('home page')),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  posicaoPagina = value;
                });
              },
              children: const [
                ConsultaCep(),
                TarefaPage(),
                MyPage2(),
              ],
            ),
          ),
          BottomNavigationBar(
              onTap: (value) => controller.jumpToPage(value),
              currentIndex: posicaoPagina,
              items: const [
                BottomNavigationBarItem(
                    label: 'Http', icon: Icon(Icons.download_sharp)),
                BottomNavigationBarItem(
                    label: 'Tarefas', icon: Icon(Icons.list)),
                BottomNavigationBarItem(label: 'pag2', icon: Icon(Icons.home)),
              ])
        ],
      ),
    );
  }
}
