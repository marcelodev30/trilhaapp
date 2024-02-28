import 'package:dio/dio.dart';

void main() async {
  Future getCep(String cep) async {
    var dio = Dio();
    dio.options.baseUrl = 'https://parseapi.back4app.com/classes/cep';
    dio.options.headers['X-Parse-Application-Id'] =
        'hB4vhQIaqplzyNPwvGu06Se8fhlXO0Wi9pMwfDDi';
    dio.options.headers['X-Parse-REST-API-Key'] =
        'jbpL8hQwAiHd1YuPjyRyue7TLltU2HnYwmo5jnUj';

    var response = await dio.get('?where={"cep":"$cep"}');
    List data = response.data['results'];

    if (data.isEmpty) {
      var viacepapi = await Dio().get('https://viacep.com.br/ws/$cep/json/');
      if (viacepapi.statusCode == 200) {
        if (viacepapi.data['erro']) {
          return 'Cep nao ecomtado';
        } else {
          return viacepapi.data;
        }
        // await dio.post('', data: viacepapi.data as Map);
      }
    } else {
      return data[0] as Map;
    }
  }

  var aa = await getCep('01001-000');
  print(aa);
}
//?where={"cep":"58187-000"}