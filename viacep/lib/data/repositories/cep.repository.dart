import 'package:viacep/data/models/cep.back4app.model.dart';
import 'package:viacep/data/repositories/dio.app.dart';
import 'package:viacep/data/repositories/viacep.dart';

class CepRepository {
  final dio = DioApp.back4app().dio;

  Future<CepModel> getCep(String cep) async {
    final response = await dio.get('?where={"cep":"$cep"}');
    List data = response.data['results'];

    if (data.isEmpty) {
      final response = await ViaCep.get(cep);
      if (response.statusCode == 200) {
        await dio.post('', data: response.data as Map);

        return CepModel.fromJson(response.data);
      } else {
        return response.data;
      }
    } else {
      return CepModel.fromJson(data[0]);
    }
  }

  Future<List<CepModel>> findcepAll() async {
    var response = await dio.get('');
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((e) => CepModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> delete(String id) async {
    await dio.delete('/$id');
  }

  Future<void> update(CepModel model) async {
    await dio.put('/${model.objectId}',data: model.createJson());
  }
}
