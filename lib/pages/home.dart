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
  TextStyle resultadoStyle =
    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600);
  TextEditingController valor = TextEditingController();
  TextEditingController periodo = TextEditingController();
  TextEditingController taxaDi = TextEditingController();
  TextEditingController cdb = TextEditingController();
  TextEditingController lciLca = TextEditingController();

  String txtPoupanca = '';
  String txtCDB = '';
  String txtLciLca = '';
  String impRendaString = '';

  @override
  void initState() {
    valor.text = '10000';
    periodo.text = '12';
    taxaDi.text = '10.65';
    cdb.text = '100';
    lciLca.text = '100';
    super.initState();
  }

  void calcularResultado() {
    loseFocus();

    double valorInicial = double.parse(valor.text);
    double periodoInv = double.parse(periodo.text);
    double porcCDB = double.parse(cdb.text);
    double porcDi = double.parse(taxaDi.text);
    double porcLci = double.parse(lciLca.text);
    double impRenda = 0;

    if (periodoInv <= 6) {
      impRenda = 22.5;
      impRendaString = "Imposto de Renda 22.5%";
    } else if (periodoInv <= 12) {
      impRenda = 20;
      impRendaString = "Imposto de Renda 20%";
    } else if (periodoInv <= 24) {
      impRenda = 17.5;
      impRendaString = "Imposto de Renda 17.5%";
    } else {
      impRenda = 15;
      impRendaString = "Imposto de Renda 15%";
    }

    txtPoupanca = calcularPoupanca(valorInicial, periodoInv).toStringAsFixed(2);
    txtCDB = calcularCdb(valorInicial, periodoInv, porcDi, porcCDB, impRenda)
        .toStringAsFixed(2);

    txtLciLca = calcularLciLca(valorInicial, periodoInv, porcDi, porcLci)
        .toStringAsFixed(2);

    setState(() {
      txtPoupanca;
      txtCDB;
      txtLciLca;
      impRendaString;
    });
  }

  void loseFocus() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        loseFocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Calculadora Renda Fixa'),
            actions: [
              IconButton(
                  icon: const Icon(
                    Icons.tune_outlined,
                  ),
                  onPressed: () {}),
              const SizedBox(
                width: 8,
              ),
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
                height: 20,
              ),
              TextField(
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
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
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^(\d+)?\.?\d{0,2}'))
                      ],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
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
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      minLines: 1,
                      maxLines: 1,
                      maxLength: 10,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      controller: taxaDi,
                      decoration: const InputDecoration(
                        labelText: "DI - % ao Ano",
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
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      minLines: 1,
                      maxLines: 1,
                      maxLength: 10,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      controller: cdb,
                      decoration: const InputDecoration(
                        labelText: "% CDB",
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
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
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
              Visibility(
                visible: txtPoupanca.isNotEmpty,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  leading: const Icon(Icons.attach_money_outlined),
                  title: const Text('Poupança:'),
                  trailing: Text("R\$ "+txtPoupanca,style: resultadoStyle),
                ),
              ),
              Visibility(
                visible: txtCDB.isNotEmpty,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  leading: const Icon(Icons.attach_money_outlined),
                  title: const Text('CDB:'),
                  trailing: Text("R\$ "+txtCDB,style: resultadoStyle),
                  subtitle: Text(impRendaString),
                ),
              ),
              Visibility(
                visible: txtLciLca.isNotEmpty,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  leading: const Icon(Icons.attach_money_outlined),
                  title: const Text('LCI / LCA:'),
                  trailing: Text("R\$ "+txtLciLca,style: resultadoStyle),
                ),
              ),
            ],
          )),
    );
  }
}
