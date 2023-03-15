import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({super.key, required this.controladorUsuario});
  final TextEditingController controladorUsuario;

  @override
  State<StatefulWidget> createState() {
    return IndexState();
  }
}

class IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //se adapta a diferentes tamanhos de tela
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: const <TextSpan>[
                    TextSpan(
                      text: "GitHub\n",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "Visualizador de Repositórios\n",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
            TextField(
              maxLength: 39, //max caracteres permitido pelo github
              controller: widget.controladorUsuario,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: ("Usuário Github"),
                hintText: ("Digite o nome do usuário"),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
