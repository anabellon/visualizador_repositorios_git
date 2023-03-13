import 'package:flutter/material.dart';

import 'pesquisa.dart';
import 'telainicial.dart';

class Tela extends StatefulWidget {
  const Tela({super.key});

  @override
  State<StatefulWidget> createState() {
    return TelaState();
  }
}

class TelaState extends State<Tela> {
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
            TelaInicial(
              controladorUsuario: _controlador,
            ),
            Pesquisa(
              controladorUsuario: _controlador,
            ),
          ],
        ),
      ),
    );
  }
}
