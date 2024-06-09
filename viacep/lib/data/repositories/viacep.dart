import 'package:dio/dio.dart';
import 'package:viacep/data/repositories/dio.app.dart';

class ViaCep {

static  final dio = DioApp.viaCep().dio;

static Future<Response<dynamic>> get(String cep)async{
    return dio.get('$cep/json/'); 
}

}
