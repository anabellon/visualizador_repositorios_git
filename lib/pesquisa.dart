import 'package:flutter/material.dart';

class Pesquisa extends StatefulWidget {
  final TextEditingController controladorUsuario;
  const Pesquisa({super.key, required this.controladorUsuario});
  @override
  _PesquisaState createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisa> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            _eventoClick(context);
          },
          child: const Text(
            "Pesquisar Repositórios",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  void _eventoClick(BuildContext context) {
    //onPressed
    widget.controladorUsuario;
  }
}
