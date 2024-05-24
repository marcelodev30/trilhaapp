import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:trilhaapp/models/dados_cadastrais.model.dart';
import 'package:trilhaapp/service/init_app.dart';
import 'my_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  Hive.registerAdapter(DadosCadastraisModelAdapter());
  await initDatabase();
  runApp(const Myapp());
}
