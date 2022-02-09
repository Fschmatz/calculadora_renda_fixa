import 'dart:math' as math;

double calcularPoupanca(double valorAplic, double periodo) {
  return valorAplic * (math.pow(0.5 / 100 + 1, periodo)) - valorAplic;
}

num calcularLci(double valorAplic, double periodo, double di, double impRenda,
    double porcLci) {


  print ("valor sem desconto "+(valorAplic * (math.pow(di / periodo , periodo)) - valorAplic).toString());

//Math.pow(((porcLci / 100 * di) / 100 + 1), (1 / 12));

  double taxa = impRenda / 100;
  num v = math.pow(( di / 100 + 1), periodo);

  //print("v -> " + v.toString());
  //print("v desc -> "+(v - (v * impRenda / 100)).toString());*/

  return 1; //800
}

double calcularCdb(double valorAplic, double periodo) {
  return 1;
}

double calcularTesouro(double valorAplic, double periodo) {
  return 1;
}
