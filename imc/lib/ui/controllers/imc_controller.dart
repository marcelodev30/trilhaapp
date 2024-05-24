import 'package:imc/data/models/imc_models.dart';
import '../../data/service/calcular.dart';
import '../../data/service/tratamento_saidas.dart';

class ImcController {
  static void calcularIMC(ImcModels models) {
    models.imc = Calcular.imc(models.peso, models.altura);
    models.resultado = saidas(models.imc);
  }
}
