import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../util/changelog.dart';
import '../util/dialog_select_theme.dart';
import '../util/utils_functions.dart';


class PgConfigs extends StatefulWidget {

  @override
  _PgConfigsState createState() => _PgConfigsState();

  Function()? refresh;

  PgConfigs({Key? key, this.refresh}) : super(key: key);
}

class _PgConfigsState extends State<PgConfigs> {

  String getThemeStringFormatted(){
    String theme =  EasyDynamicTheme.of(context).themeMode.toString().replaceAll('ThemeMode.', '');
    if(theme == 'system'){
      theme = 'padrão do sistema';
    }else if (theme == 'light'){
      theme = 'claro';
    }else {
      theme = 'escuro';
    }
    return capitalizeFirstLetterString(theme);
  }

  _launchGithub() {
    const url = 'https://github.com/Fschmatz/calculadora_renda_fixa';
    launch(url);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Configurações"),
        ),
        body: ListView(
          children: <Widget>[
            Card(
              elevation: 1,
              margin: const EdgeInsets.fromLTRB(16, 20, 16, 25),
              color: Theme.of(context).colorScheme.primary,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: ListTile(
                title: Text(
                  Changelog.appName + " " + Changelog.appVersion,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 17.5, color: Colors.black),
                ),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const SizedBox(
                height: 0.1,
              ),
              title: Text("Código Fonte".toUpperCase(),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                  )),
            ),
            ListTile(
              onTap: () {
                _launchGithub();
              },
              leading: const Icon(Icons.open_in_new_outlined),
              title: const Text("Ver no Github",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue)),
            ),
            const Divider(),
            ListTile(
              leading: const SizedBox(
                height: 0.1,
              ),
              title: Text("Geral".toUpperCase(),
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary)),
            ),
            ListTile(
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const DialogSelectTheme();
                  }),
              leading: const Icon(Icons.brightness_6_outlined),
              title: const Text(
                "Tema do aplicativo",
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                getThemeStringFormatted(),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const SizedBox(
                height: 0.1,
              ),
              title: Text("Changelog".toUpperCase(),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                  )),
            ),
            ListTile(
              leading: const SizedBox(
                height: 0.1,
              ),
              title: Text(
                Changelog.changelogs,
                style: const TextStyle(fontSize: 16),
              ),
            ),

          ],
        ));
  }
}
