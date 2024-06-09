import 'package:viacep/data/models/cep.back4app.model.dart';
import 'package:viacep/data/repositories/dio.app.dart';
import 'package:viacep/data/repositories/viacep.dart';

class ViaCepRepository {

  Future<CepModel> getCep(String cep) async {
    final dio = DioApp.back4app().dio;
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




  
}
