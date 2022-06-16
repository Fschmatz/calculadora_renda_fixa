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
  String getThemeStringFormatted() {
    String theme = EasyDynamicTheme.of(context)
        .themeMode
        .toString()
        .replaceAll('ThemeMode.', '');
    if (theme == 'system') {
      theme = 'padrão do sistema';
    } else if (theme == 'light') {
      theme = 'claro';
    } else {
      theme = 'escuro';
    }
    return capitalizeFirstLetterString(theme);
  }

  _launchGithub() {
    launchUrl(
      Uri.parse('https://github.com/Fschmatz/calculadora_renda_fixa'),
      mode: LaunchMode.externalApplication,
    );
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
            ListTile(
              title: Text("Geral",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
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
              ),
              subtitle: Text(
                getThemeStringFormatted(),
              ),
            ),
            ListTile(
              title: Text("Código Fonte",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
            ListTile(
              title: Text("Changelog",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                  )),
            ),
            ListTile(
              leading: const Icon(
                Icons.article_outlined,
              ),
              title: Text(
                Changelog.changelogs,
              ),
            ),
          ],
        ));
  }
}
