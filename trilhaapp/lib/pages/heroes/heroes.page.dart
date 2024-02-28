import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/mavel/marvel.repository.dart';

import '../../models/characters.model.dart';

class HeroesPage extends StatefulWidget {
  const HeroesPage({super.key});

  @override
  State<HeroesPage> createState() => _HeroesPageState();
}

class _HeroesPageState extends State<HeroesPage> {
  var scrollController = ScrollController();
  late MarvelRepository marvelRepository;
  var mavelModel = CharactersModel();
  bool isloaded = false;
  bool carregado = false;
  int offset = 0;
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent * 0.7) {
        carregarDados();
      }
    });
    marvelRepository = MarvelRepository();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    if (carregado) return;
    if (mavelModel.data == null || mavelModel.data!.results == null) {
      isloaded = true;
      mavelModel = await marvelRepository.getCharacters(offset);
      setState(() {
        isloaded = false;
      });
    } else {
      setState(() {
        carregado = true;
      });
      offset += mavelModel.data!.count!;
      var newdados = await marvelRepository.getCharacters(offset);
      mavelModel.data!.results!.addAll(newdados.data!.results!);
      carregado = false;
    }
    setState(() {});
  }

  int quantidade(bool total) {
    try {
      if (total) {
        return mavelModel.data!.total!;
      } else {
        return offset + mavelModel.data!.count!;
      }
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          centerTitle: true,
          title: Text('Herois: ${quantidade(false)} de ${quantidade(true)}')),
      body: isloaded
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        controller: scrollController,
                        itemCount: (mavelModel.data == null ||
                                mavelModel.data!.results == null)
                            ? 0
                            : mavelModel.data!.results!.length,
                        itemBuilder: (_, index) {
                          var mavel = mavelModel.data!.results![index];

                          return Card(
                            elevation: 6,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    mavel.name.toString(),
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 10),
                                  Image.network(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    mavel.thumbnail!.path! +
                                        '.' +
                                        mavel.thumbnail!.extension!.toString(),
                                    height: 340,
                                    width: 340,
                                  ),
                                  mavel.description!.isEmpty
                                      ? const Text('')
                                      : Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            mavel.description.toString(),
                                            style:
                                                const TextStyle(fontSize: 20),
                                            textAlign: TextAlign.justify,
                                          ),
                                        )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
