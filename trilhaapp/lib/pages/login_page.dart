import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 234, 234),
        appBar: AppBar(title: const Text("Login")),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                const Icon(
                  Icons.person,
                  size: 150,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  color: const Color.fromARGB(255, 99, 150, 216),
                  height: 40,
                  width: double.infinity,
                  child: const Text('Informe seu Email: '),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                  color: const Color.fromARGB(255, 99, 150, 216),
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  height: 40,
                  width: double.infinity,
                  child: const Text('Informe a Senha: '),
                ),
                Expanded(child: Container()),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  color: const Color.fromARGB(255, 99, 150, 216),
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  height: 40,
                  width: double.infinity,
                  child: const Center(child: Text('Login')),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  //color: const Color.fromARGB(255, 99, 150, 216),
                  padding: const EdgeInsets.only(left: 10, top: 0),
                  height: 40,
                  width: double.infinity,
                  child: const Center(child: Text('Cadastro')),
                ),
              ]),
        ));
  }
}
