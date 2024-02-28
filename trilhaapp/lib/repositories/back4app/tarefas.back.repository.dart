import 'package:dio/dio.dart';

import '../../models/tarefasb.model.dart';

class TarefasBack4appRepository {
  var _dio = Dio();
  TarefasBack4appRepository() {
    _dio = Dio();
    _dio.options.baseUrl = 'https://parseapi.back4app.com/classes/Tarefas';
    _dio.options.headers['X-Parse-Application-Id'] =
        'vEZ2E9koQcnoi2AvOGjIPFG33ykRlE2G0xtJixWs';
    _dio.options.headers['X-Parse-REST-API-Key'] =
        'ITxPN19MTfwbe8clpmEDXQSeqyqbSZbr255O9S9O';
  }

  Future<TarafaModelBack4app> get() async {
    var result = await _dio.get('');
    return TarafaModelBack4app.fromJson(result.data);
  }

  Future<void> save(TarefaModel model) async {
    try {
      await _dio.post('', data: model.toCreateJson());
    } catch (e) {
      throw 'Erro http';
    }
  }

  Future<void> delete(String id) async {
    try {
      await _dio.delete('/$id');
    } catch (e) {
      throw 'Erro http';
    }
  }

  Future<void> update(TarefaModel model) async {
    try {
      await _dio.put('/${model.objectId}', data: model.toCreateJson());
    } catch (e) {
      throw 'Erro http';
    }
  }
}
