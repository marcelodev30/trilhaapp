import 'package:dio/dio.dart';
import 'package:viacep/models/cep.back4app.model.dart';

class ViaCepRepository {
  Future<CepModel> getCep(String cep) async {
    var dio = Dio();
    dio.options.baseUrl = 'https://parseapi.back4app.com/classes/cep';
    dio.options.headers['X-Parse-Application-Id'] =
        'hB4vhQIaqplzyNPwvGu06Se8fhlXO0Wi9pMwfDDi';
    dio.options.headers['X-Parse-REST-API-Key'] =
        'jbpL8hQwAiHd1YuPjyRyue7TLltU2HnYwmo5jnUj';

    var response = await dio.get('?where={"cep":"$cep"}');
    List data = response.data['results'];

    if (data.isEmpty) {
      var response = await Dio().get('https://viacep.com.br/ws/$cep/json/');
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
