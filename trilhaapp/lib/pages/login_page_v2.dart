import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/home_page.dart';

class LoginPageV2 extends StatefulWidget {
  const LoginPageV2({super.key});

  @override
  State<LoginPageV2> createState() => _LoginPageV2State();
}

class _LoginPageV2State extends State<LoginPageV2> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController senhaController = TextEditingController(text: '');
  bool senha_obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromARGB(255, 238, 234, 234),
        backgroundColor: Colors.black,
        //appBar: AppBar(title: const Text("Login")),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 90),
                  //const Icon(Icons.person, size: 150),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 4,
                        child: Image.asset(
                          'img/logo_dio.png',
                        ),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Já tem cadastro ?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Faça seu login e make the change',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    width: double.infinity,
                    child: TextField(
                      controller: emailController,
                      inputFormatters: const [],
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          //contentPadding: EdgeInsets.only(top: 0),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(195, 228, 37, 212))),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(195, 228, 37, 212))),
                          suffixStyle: TextStyle(color: Colors.white),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color.fromARGB(195, 228, 37, 212),
                          )),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                    width: double.infinity,
                    //alignment: Alignment.center,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      obscureText: senha_obscure,
                      controller: senhaController,
                      inputFormatters: const [],
                      decoration: InputDecoration(

                          //contentPadding: EdgeInsets.only(bottom: 0),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(195, 228, 37, 212))),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(195, 228, 37, 212))),
                          suffixStyle: const TextStyle(color: Colors.white),
                          hintText: 'Senha',
                          hintStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.key,
                            color: Color.fromARGB(195, 228, 37, 212),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                senha_obscure = !senha_obscure;
                              });
                            },
                            child: Icon(
                                senha_obscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color.fromARGB(195, 228, 37, 212)),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                    //padding: const EdgeInsets.only(left: 10, top: 10),

                    width: double.infinity,
                    child: SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(195, 228, 37, 212))),
                          onPressed: () {
                            if (emailController.text.trim() == "1" &&
                                senhaController.text.trim() == '1') {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                      content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error_outline_rounded,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text('Erro ao efetuar o login'),
                                  )
                                ],
                              )));
                            }
                          },
                          child: const Text(
                            'ENTRAR',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(height: 60),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                    //color: const Color.fromARGB(255, 99, 150, 216),
                    padding: const EdgeInsets.only(left: 10, top: 0),
                    height: 30,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      'Esquici minha senha',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                    //color: const Color.fromARGB(255, 99, 150, 216),
                    padding: const EdgeInsets.only(left: 10, top: 0),
                    height: 30,
                    width: double.infinity,
                    child: const Center(
                        child: Text(
                      'Criar conta',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ]),
          ),
        ));
  }
}
