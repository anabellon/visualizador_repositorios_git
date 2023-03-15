import 'package:flutter/material.dart';

import 'components/usersearch.dart';
import 'pages/index.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final TextEditingController _controlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("GitHub - Visualizador de Repositórios"),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Index(
              controladorUsuario: _controlador,
            ),
            UserSearch(
              controladorUsuario: _controlador,
            ),
          ],
        ),
      ),
    );
  }
}
