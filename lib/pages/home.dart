import 'package:calculadora_renda_fixa/pages/configs/pg_configs.dart';
import 'package:calculadora_renda_fixa/pages/util/calc_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double txtFieldSpacing = 25;
  TextStyle labelStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  TextEditingController valor = TextEditingController();
  TextEditingController periodo = TextEditingController();
  TextEditingController taxaDi = TextEditingController();
  TextEditingController taxaSelic = TextEditingController();
  TextEditingController cdb = TextEditingController();
  TextEditingController lciLca = TextEditingController();

  String _resultado = '';

  @override
  void initState() {
    super.initState();
  }

  void calcularResultado(){

    double valorInicial = double.parse(valor.text);
   // double valorFinal = double.parse(valor.text) * 2;
    double periodoInv = double.parse(periodo.text);
    /*double di =  double.parse(taxaDi.text);
    double selic =  double.parse(taxaSelic.text);
    double porcCDB =  double.parse(cdb.text);
    double porcLc =  double.parse(lciLca.text);*/
    double impRenda = 0;
    bool ir = true;

    if (periodoInv < 6) {
      impRenda = 22.5;
    } else if (periodoInv < 12) {
      impRenda = 20;
    } else if (periodoInv < 24) {
      impRenda = 17.5;
    } else {
      impRenda = 15;
    }


    _resultado += "Poupança: "+calcularPoupanca(valorInicial,periodoInv).toStringAsFixed(2)+"\n";
    //_resultado += "LCI / LCA: "+calcularLci(valorInicial,periodoInv).toStringAsFixed(2)+"\n";

    setState(() {
      _resultado;
    });
  }


/*calcularImpostoRenda(){

    double impRenda = 0;

    var valorFinal = valorInicial + (valorFinal - valorInicial) / (1 - (faixaIr / 100));
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora Renda Fixa'),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.settings_outlined,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => PgConfigs(),
                        fullscreenDialog: true,
                      ));
                }),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                    RegExp(r'^(\d+)?\.?\d{0,2}'))
              ],
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              minLines: 1,
              maxLines: 1,
              maxLength: 10,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              controller: valor,
              decoration: const InputDecoration(
                labelText: "Valor da Aplicação",
                counterText: "",
              ),
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 16,
              ),
              onEditingComplete: () => {},
            ),
            SizedBox(
              height: txtFieldSpacing,
            ),
            TextField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                    RegExp(r'^(\d+)?\.?\d{0,2}'))
              ],
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              minLines: 1,
              maxLines: 1,
              maxLength: 10,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              controller: periodo,
              decoration: const InputDecoration(
                labelText: "Período (Meses)",
                counterText: "",
              ),
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 16,
              ),
              onEditingComplete: () => {},
            ),
            SizedBox(
              height: txtFieldSpacing,
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    minLines: 1,
                    maxLines: 1,
                    maxLength: 10,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: taxaDi,
                    decoration: const InputDecoration(
                      labelText: "Taxa DI - % ao Ano",
                      counterText: "",
                    ),
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    onEditingComplete: () => {},
                  ),
                ),
                SizedBox(
                  width: txtFieldSpacing,
                ),
                Flexible(
                  child: TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    minLines: 1,
                    maxLines: 1,
                    maxLength: 10,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: taxaSelic,
                    decoration: const InputDecoration(
                      labelText: "Taxa Selic - % ao Ano",
                      counterText: "",
                    ),
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    onEditingComplete: () => {},
                  ),
                ),
              ],
            ),
           
            SizedBox(
              height: txtFieldSpacing,
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    minLines: 1,
                    maxLines: 1,
                    maxLength: 10,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: cdb,
                    decoration: const InputDecoration(
                      labelText: "% CDB / LC",
                      counterText: "",
                    ),
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    onEditingComplete: () => {},
                  ),
                ),
                SizedBox(
                  width: txtFieldSpacing,
                ),
                Flexible(
                  child: TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    minLines: 1,
                    maxLines: 1,
                    maxLength: 10,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: lciLca,
                    decoration: const InputDecoration(
                      labelText: "% LCI / LCA",
                      counterText: "",
                    ),
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    onEditingComplete: () => {},
                  ),
                ),
              ],
            ),


            const SizedBox(
              height: 40,
            ),
            Center(
              child: SizedBox(
                width: 120,
                height: 45,
                child: ElevatedButton.icon(
                  label: const Text('Calcular'),
                  icon: const Icon(Icons.calculate_outlined),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Theme.of(context).colorScheme.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: () {
                    calcularResultado();
                  },
                  //child:
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(_resultado),
          ],
        ));
  }
}
