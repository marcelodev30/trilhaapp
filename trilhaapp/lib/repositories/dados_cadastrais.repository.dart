import 'package:hive/hive.dart';
import 'package:trilhaapp/models/dados_cadastrais.model.dart';

String _keyDadosCadastraisDatabase = 'keyDadosCadastraisDatabase';
String _keyDadosCadastrais = 'keyDadosCadastrais';

class DadosCadastraisRepositors {
  // ignore: unused_field
  static late Box _box;

  DadosCadastraisRepositors() {
    load();
  }
  static Future<void> load() async {
    if (Hive.isBoxOpen(_keyDadosCadastraisDatabase)) {
      _box = Hive.box(_keyDadosCadastraisDatabase);
    } else {
      _box = await Hive.openBox(_keyDadosCadastraisDatabase);
    }
  }

  void save(DadosCadastraisModel dadosCadastraisModel) {
    _box.put(_keyDadosCadastraisDatabase, dadosCadastraisModel);
  }

  DadosCadastraisModel fetchData() {
    var dados = _box.get(_keyDadosCadastrais);
    if (dados == null) {}
    return dados;
  }
}
