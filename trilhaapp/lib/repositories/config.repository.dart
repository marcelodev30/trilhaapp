import 'package:hive/hive.dart';
import 'package:trilhaapp/pages/conf/models/config.models.dart';

String keyDatabaseConfig = 'configKey';
String keyconfig = 'configKeyModel';

class ConfigRepository {
  // ignore: unused_field
  late Box _box;

  ConfigRepository() {
    load();
  }
  Future<void> load() async {
    if (Hive.isBoxOpen(keyDatabaseConfig)) {
      _box = Hive.box(keyDatabaseConfig);
    } else {
      _box = await Hive.openBox(keyDatabaseConfig);
    }
  }

  void save(ConfigModel configModel) {
    _box.put(keyconfig, {
      'nome': configModel.getName,
      'altura': configModel.getAltura,
      'receberNotifi': configModel.getReceberNotifi,
      'modeDark': configModel.getModeDark
    });
  }

  ConfigModel fetchData() {
    var configModelData = _box.get(keyconfig);
    if (configModelData != null) {
      return ConfigModel(
        configModelData['nome'],
        configModelData['altura'],
        configModelData['receberNotifi'],
        configModelData['modeDark'],
      );
    } else {
      return ConfigModel.isEmpty();
    }
  }
}
