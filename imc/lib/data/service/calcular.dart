class Calcular {
  
  static double imc(double peso,double altura){
    return double.parse((peso / (altura * altura)).toStringAsFixed(2)); 
}

}

