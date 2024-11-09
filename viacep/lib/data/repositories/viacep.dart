import 'package:viacep/data/repositories/dio.app.dart';
import '../models/viacep.model.dart';

class ViaCep {
  static final dio = DioApp.viaCep().dio;

  static Future<ViaCepModel> fetchByCep(String cep) async {
    final response = await dio.get('$cep/json/');
    if (response.statusCode == 200) {
      return ViaCepModel.fromJson(response.data);
    } else {
      return ViaCepModel.isEmpty();
    }
  }
}
