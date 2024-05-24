String saidas(double imc) {
  String resultado = '';
  if (imc <= 18.5) {
    resultado = 'Abaixo do peso normal';
  }
  if (imc >= 18.6 && imc <= 24.9) {
    resultado = 'Normal';
  }
  if (imc >= 25.0 && imc <= 29.9) {
    resultado = 'Sobrepeso';
  }
  if (imc >= 30.0 && imc <= 34.9) {
    resultado = 'Obesidade grau I';
  }
  if (imc >= 35.0 && imc <= 39.9) {
    resultado = 'Obesidade grau II';
  }
  if (imc >= 40.0) {
    resultado = 'Obesidade grau III';
  }
  return resultado;
}
