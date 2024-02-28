import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trilhaapp/pages/new%20app/drawer_custon.dart';
import 'package:url_launcher/url_launcher.dart';
import 'brasil_fields /brasil.fields.page.dart';

class NewAppHomePage extends StatefulWidget {
  const NewAppHomePage({super.key});

  @override
  State<NewAppHomePage> createState() => _NewAppHomePageState();
}

class _NewAppHomePageState extends State<NewAppHomePage>
    with TickerProviderStateMixin {
  late TabController pageController;
  List message = ['ok', 'sadsadsadas', 'ddfdf'];

  @override
  void initState() {
    super.initState();
    pageController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerCustonV2(),
      appBar: AppBar(
        title: const Text('New app'),
        backgroundColor: Colors.red,
      ),
      body: TabBarView(
        controller: pageController,
        children: [
          const BrasilFieldsPage(),
          Container(
            color: Colors.indigo,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    final Uri smsLaunchUri = Uri(
                      scheme: 'sms',
                      path: '+5583991419068 ',
                      queryParameters: <String, String>{
                        'body': Uri.encodeComponent(
                            'Example Subject & Symbols are allowed!'),
                      },
                    );

                    await launchUrl(smsLaunchUri);
                  },
                  child: const Text(
                    '83 999212121212',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          ListView.builder(
              itemCount: message.length,
              itemBuilder: (_, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: ListTile(
                    title: Text(message[index]),
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    trailing: const Icon(Icons.clear_all),
                  ),
                );
              }),
        ],
      ),
      bottomNavigationBar: ConvexAppBar.badge(
        badgeMargin: const EdgeInsets.only(bottom: 30, left: 30),
        badgePadding: const EdgeInsets.symmetric(horizontal: 5),
        badgeBorderRadius: 20,
        {2: message.isNotEmpty ? '${message.length}' : null},
        onTap: (index) => pageController.index = index,
        controller: pageController,
        style: TabStyle.react,
        items: const [
          TabItem(icon: FontAwesomeIcons.satellite, title: 'Cep'),
          TabItem(icon: FontAwesomeIcons.house, title: 'Home'),
          TabItem(icon: FontAwesomeIcons.message, title: 'Message')
        ],
      ),
    );
  }
}
//FaIcon(FontAwesomeIcons.nodeJs)