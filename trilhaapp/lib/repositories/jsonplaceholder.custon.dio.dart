import 'package:dio/dio.dart';

class CustonDioV1 {
  final _dio = Dio();
  Dio get dio => _dio;
  CustonDioV1() {
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
  }
}
