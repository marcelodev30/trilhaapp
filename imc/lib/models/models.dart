class ImcModels {
  double _peso = 0.0;
  double _altura = 0.0;
  double _imc = 00.0;
  // ignore: prefer_final_fields
  DateTime _date = DateTime.now();

  set setPeso(valeu) => _peso = valeu;
  set setImc(valeu) => _imc = valeu;
  set setAltura(valeu) => _altura = valeu;

  double get getPeso => _peso;
  double get getImc => _imc;
  DateTime get getDate => _date;
  ImcModels();
  ImcModels.c(this._altura, this._peso, this._imc);
  double get getAltura => _altura;

  
  @override
  String toString() => 'Tenho ${_altura}m de altura e peso ${_peso}kg.';
}
