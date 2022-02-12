import 'dart:math' as math;

double calcularJurosCompostos(
    double valorAplic, double periodo, double porcentagem) {
  return valorAplic * (math.pow(porcentagem, periodo)) - valorAplic;
}

double calcularPoupanca(double valorAplic, double periodo) {
  return calcularJurosCompostos(valorAplic, periodo, 0.5 / 100 + 1);
}

List calcularCdb(double valorAplic, double periodo, double porcDi,
    double porcCdb, double impRenda) {
  double calcCdb = double.parse(
      math.pow(((porcCdb / 100 * porcDi) / 100 + 1), (1 / 12)).toString());

  double valorSemDescontos =
      calcularJurosCompostos(valorAplic, periodo, calcCdb);
  double valorComDesconto =
      valorSemDescontos - (valorSemDescontos * (impRenda / 100));

  return [valorComDesconto, valorSemDescontos - valorComDesconto];
}

double calcularLciLca(
    double valorAplic, double periodo, double porcDi, double porcLci) {
  double calcRend = double.parse(
      math.pow(((porcLci / 100 * porcDi) / 100 + 1), (1 / 12)).toString());

  double valor = calcularJurosCompostos(valorAplic, periodo, calcRend);

  return valor;
}
