class ImcModels {
  int id = -1;
  double altura = 0;
  double peso = 0;
  double imc = 0;
  String resultado = '';

  ImcModels(this.altura, this.peso, this.imc, this.resultado);
  ImcModels.empty();
  //factory ImcModels.empty() => ImcModels(0, 0, 0, 22.00, 'Normal');

  Map<String, dynamic> toJson() {
    return {
      if (id >= 0) 'id': id,
      'altura': altura,
      'peso': peso,
      'imc': imc,
      'resultado': resultado
    };
  }

  ImcModels.fromJson(Map<String, dynamic> value) {
    id = value['id'];
    altura = value['altura'];
    peso = value['peso'];
    imc = value['imc'];
    resultado = value['resultado'];
  }
}
