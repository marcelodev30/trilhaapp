class ImcModels {
  int idade = 0;
  double peso = 0;
  double altura = 0;
  double imc = 0.0;
  String descricao = 'Peso Normal';
  DateTime date = DateTime.now();

  set setPeso(valeu) => peso = valeu;
  set setImc(valeu) => imc = valeu;
  set setAltura(valeu) => altura = valeu;
  set setDate(valeu) => date = valeu;

  double get getPeso => peso;
  double get getImc => imc;
  DateTime get getDate => date;

  ImcModels();
  ImcModels.c(this.altura, this.peso, this.imc);
  double get getAltura => altura;
}
