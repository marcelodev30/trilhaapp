import 'package:dio/dio.dart';

class DioApp {
  final Dio _dio = Dio();

  DioApp.viaCep() {
    _dio.options.baseUrl = 'https://viacep.com.br/ws/';
  }

  DioApp.back4app() {
    _dio.options.baseUrl = 'https://parseapi.back4app.com/classes/cep';
    _dio.options.headers['X-Parse-Application-Id'] =
        'hB4vhQIaqplzyNPwvGu06Se8fhlXO0Wi9pMwfDDi';
    _dio.options.headers['X-Parse-REST-API-Key'] =
        'jbpL8hQwAiHd1YuPjyRyue7TLltU2HnYwmo5jnUj';
  }

  Dio get dio => _dio;
}
