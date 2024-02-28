import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:trilhaapp/pages/postspage.dart';

import '../../pages/auto_size_text/auto.size.text.dart';
import '../../pages/dados_cadastrais.dart';
import '../../pages/heroes/heroes.page.dart';
import '../../pages/imc.page.dart';
import '../../pages/login_page_v2.dart';
import '../../pages/new app/home.page.dart';
import '../../pages/percent_indicator.dart';
import '../../pages/tarefa.http/tarefa.page.dart';

// ignore: use_key_in_widget_constructors
class DrawerCuston extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (context) {
                    return Wrap(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.camera_alt),
                          title: const Text('Camera'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.photo),
                          title: const Text('Galeria'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  });
            },
            child: const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                currentAccountPicture: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('img/marcelo_alve.jpg'),
                ),
                accountName: Text('Marcelo Alve'),
                accountEmail: Text('Marcelo@gmail.com')),
          ),
          const SizedBox(height: 5),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyDados(
                              texto: 'Meus Dados',
                            )));
              },
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidFloppyDisk,
                    color: Colors.blue,
                    size: 22,
                  ),
                  SizedBox(width: 5),
                  Text('Dados cadastráis',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () {},
              child: const Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 5),
                  Text('Configurações',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PostesPage()));
              },
              child: const Row(
                children: [
                  Icon(Icons.post_add),
                  SizedBox(width: 5),
                  Text('Posts',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ImcPage()));
              },
              child: const Row(
                children: [
                  Icon(Icons.post_add),
                  SizedBox(width: 5),
                  Text('IMC',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HeroesPage()));
              },
              child: const Row(
                children: [
                  Icon(Icons.post_add),
                  SizedBox(width: 5),
                  Text('Herois',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TarefasHttpPage()));
              },
              child: const Row(
                children: [
                  Icon(Icons.post_add),
                  SizedBox(width: 5),
                  Text('Tarefas http',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),

          //PercentIndicatorPage

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PercentIndicatorPage()));
              },
              child: const Row(
                children: [
                  FaIcon(FontAwesomeIcons.percent),
                  SizedBox(width: 5),
                  Text('PercentIndicator',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AutoSizeTextPage()));
              },
              child: const Row(
                children: [
                  FaIcon(FontAwesomeIcons.paperclip),
                  SizedBox(width: 5),
                  Text('AutoSize',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewAppHomePage()));
              },
              child: const Row(
                children: [
                  FaIcon(FontAwesomeIcons.appStore),
                  SizedBox(width: 5),
                  Text('New App',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                var f = NumberFormat('###.0#', 'en-US');
                var fBR = NumberFormat('###.0#', 'pt_BR');
                debugPrint(f.format(12.345));
                debugPrint(fBR.format(12.345));
                //Intl.defaultLocale = 'en_US';
                //var a = DateFormat.yMMMMd().format(DateTime.now());
                //print(a);
                //var data = DateTime(2022, 05, 09);
                //print(DateFormat.yMMMMd('en_US').format(DateTime.now()));
                Intl.defaultLocale = 'pt_BR';

              },
              child: const Row(
                children: [
                  FaIcon(FontAwesomeIcons.house),
                  SizedBox(width: 5),
                  Text('Intl',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(color: Colors.black),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (builder) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        title: const Text('Meu App'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPageV2()));
                              },
                              child: const Text('Sim')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Não'))
                        ],
                        content:
                            const Text('Deseja realmente sair do aplicativo ?'),
                      );
                    });
              },
              child: const Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 5),
                  Text('Sair',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
