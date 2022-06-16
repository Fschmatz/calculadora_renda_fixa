import 'package:calculadora_renda_fixa/pages/configs/pg_configs.dart';
import 'package:calculadora_renda_fixa/pages/util/calc_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double txtFieldSpacing = 30;

  TextEditingController valor = TextEditingController();
  TextEditingController periodo = TextEditingController();
  TextEditingController taxaDi = TextEditingController();
  TextEditingController cdb = TextEditingController();
  TextEditingController lciLca = TextEditingController();

  String txtPoupanca = '';
  String txtCDB = '';
  String txtLciLca = '';
  String impRendaString = '';
  String valorDescCdb = '';

  @override
  void initState() {
    carregarValoresSalvos();
    super.initState();
  }

  void salvarValores() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('valor', valor.text);
    await prefs.setString('periodo', periodo.text);
    await prefs.setString('taxaDi', taxaDi.text);
    await prefs.setString('cdb', cdb.text);
    await prefs.setString('lciLca', lciLca.text);
  }

  Future<void> carregarValoresSalvos() async {
    final prefs = await SharedPreferences.getInstance();
    valor.text = prefs.getString('valor') ?? '';
    periodo.text = prefs.getString('periodo') ?? '';
    taxaDi.text = prefs.getString('taxaDi') ?? '';
    cdb.text = prefs.getString('cdb') ?? '';
    lciLca.text = prefs.getString('lciLca') ?? '';
  }

  bool checkErros() {
    if (testValues(valor.text) &&
        testValues(periodo.text) &&
        testValues(taxaDi.text) &&
        testValues(cdb.text) &&
        testValues(lciLca.text)) {
      return true;
    } else {
      return false;
    }
  }

  bool testValues(String v) {
    return v != '' && v != '0' ? true : false;
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

    List<dynamic> cdbCalc =
        calcularCdb(valorInicial, periodoInv, porcDi, porcCDB, impRenda);
    txtCDB = cdbCalc[0].toStringAsFixed(2);
    valorDescCdb = cdbCalc[1].toStringAsFixed(2);

    txtLciLca = calcularLciLca(valorInicial, periodoInv, porcDi, porcLci)
        .toStringAsFixed(2);

    setState(() {
      txtPoupanca;
      txtCDB;
      txtLciLca;
      impRendaString;
      valorDescCdb;
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
    TextStyle resultadoStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.primary);

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
                    Icons.save_outlined,
                  ),
                  onPressed: () {
                    salvarValores();
                  }),
              const SizedBox(width: 5,),
              IconButton(
                  icon: const Icon(
                    Icons.settings_outlined,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => PgConfigs(),
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
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
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
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
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
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
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
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
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
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Center(
                child: SizedBox(
                  width: 140,
                  height: 55,
                  child: ElevatedButton.icon(
                    label:  Text(
                      'Calcular',
                      style: TextStyle(
                        fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary
                      ),
                    ),
                    icon:  Icon(Icons.calculate_outlined,
                        color: Theme.of(context).colorScheme.onPrimary
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {
                      if (checkErros()) {
                        calcularResultado();
                      } else {
                        Fluttertoast.showToast(
                          msg: "Valor Nulo ou Inválido",
                        );
                      }
                    },
                    //child:
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Visibility(
                visible: txtPoupanca.isNotEmpty,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  //leading: const Icon(Icons.attach_money_outlined),
                  title: const Text('Poupança:'),
                  trailing: Text("R\$ " + txtPoupanca, style: resultadoStyle),
                ),
              ),
              Visibility(
                visible: txtLciLca.isNotEmpty,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  //leading: const Icon(Icons.attach_money_outlined),
                  title: const Text('LCI / LCA:'),
                  trailing: Text("R\$ " + txtLciLca, style: resultadoStyle),
                ),
              ),
              Visibility(
                visible: txtCDB.isNotEmpty,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  //leading: const Icon(Icons.attach_money_outlined),
                  title: const Text('CDB:'),
                  trailing: Text("R\$ " + txtCDB, style: resultadoStyle),
                  subtitle: Text(impRendaString +
                      "\nValor do Desconto R\$ " +
                      valorDescCdb,
                    style: const TextStyle(
                      fontSize: 12
                    ),),
                ),
              ),
            ],
          )),
    );
  }
}
