import 'package:flutter/material.dart';

import '../pages/result.dart';
import '../services/apiservice.dart';

const String textSnackBar = "Entre com o usuário";

class UserSearch extends StatefulWidget {
  final TextEditingController controladorUsuario;
  const UserSearch({super.key, required this.controladorUsuario});
  @override
  UserSearchState createState() => UserSearchState();
}

class UserSearchState extends State<UserSearch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            _eventClick(context);
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

  void _eventClick(BuildContext context) {
    // // testar a saida
    // ApiService service = ApiService();
    // service.getRepositories(widget.controladorUsuario.text);

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
