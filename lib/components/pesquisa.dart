import 'package:flutter/material.dart';
import 'package:visualizador_repositorios_git/pages/result.dart';

const String textSnackBar = "Entre com o usuário";

class Pesquisa extends StatefulWidget {
  final TextEditingController controladorUsuario;
  const Pesquisa({super.key, required this.controladorUsuario});
  @override
  PesquisaState createState() => PesquisaState();
}

class PesquisaState extends State<Pesquisa> {
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
    if (widget.controladorUsuario.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Result(userName: widget.controladorUsuario.text);
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(textSnackBar),
        ),
      );
    }
  }
}
