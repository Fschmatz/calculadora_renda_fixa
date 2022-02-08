import 'dart:math' as math;

double calcularPoupanca(double valorAplic, double periodo){
  return valorAplic * (math.pow(0.5 / 100 + 1, periodo)) - valorAplic;
}

double calcularLci(double valorAplic, double periodo, double di){

  return 1;
}

double calcularCdb(double valorAplic, double periodo){
  return 1;
}

double calcularTesouro(double valorAplic, double periodo){
  return 1;
}
