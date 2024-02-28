import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  bool e = false;
  final _fromKey = GlobalKey<FormState>();
  double altura = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: Colors.indigo[600],
      body: SafeArea(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            //padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(children: [
                  SizedBox(height: 50),
                  Text('IMC',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  Text('24.6',
                      style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  Text('Peso normal',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ]),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(50, 50))),
                  child: Form(
                      key: _fromKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          const Text(
                            'Calculadora IMC',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'Ex tesee',
                                labelText: 'Nome',
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              Expanded(
                                  child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    hintText: 'Ex 1.80 ',
                                    labelText: 'Altura',
                                    border: OutlineInputBorder()),
                              )),
                              const SizedBox(width: 20),
                              Expanded(
                                  child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    hintText: 'Ex 75',
                                    labelText: 'Peso',
                                    border: OutlineInputBorder()),
                              )),
                            ],
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () {},
                            // ignore: sort_child_properties_last
                            child: const Text(
                              'Calcular IMC',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.indigo)),
                          )
                        ],
                      )),
                )
              ],
            )),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_sharp),
            label: 'IMC',
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'Historico',
          ),
        ],
      ),
    );
  }
}
