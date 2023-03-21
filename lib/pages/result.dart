import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visualizador_repositorios_git/model/repositoriesmodel.dart';
import 'package:visualizador_repositorios_git/services/apiservice.dart';

import '../components/repositorieslist.dart';

class Result extends StatefulWidget {
  final String userName;
  const Result({super.key, required this.userName});

  @override
  State<Result> createState() {
    return _ResultState();
  }
}

// !Em construção -> Reformular para se adequar ao List de dados da API
class _ResultState extends State<Result> {
  final TextEditingController _controladorAvatar = TextEditingController();
  List<Repositories> repositoriesTest = [];

  carregarRepositorios() async {
    final resposta = await Dio()
        .get("https://api.github.com/users/${widget.userName}/repos");
    if (resposta.data != null) {
      setState(
        () {
          repositoriesTest = List<Repositories>.from(resposta.data.map(
              (repositorioJson) => Repositories.fromJson(repositorioJson)));
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    carregarRepositorios();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
      home: Scaffold(
        body: SafeArea(
          //Se adapta a diferentes tamanhos de tela
          child: Column(
            children: <Widget>[
              const Text(
                "\nGitHub",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://github.com/${widget.userName}.png"), //  AssetImage("assets/images/6073873.png"),
                  ),
                  Text(
                    ("\t\t ${widget.userName}"),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 30,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...repositoriesTest.map(
                        (e) {
                          return Card(
                            elevation:
                                5, // apesar de ser usado para sombreamento, é necessário atenção por se tratar dos níveis que o card será trazido para frente
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 40),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                e.name ?? "Sem nome",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Column(
                                children: [
                                  Text(
                                    e.description ?? "Sem descrição",
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      launchUrl(Uri.parse(e.html_url ?? ""));
                                    },
                                    label: const Text(
                                      "Abrir repo",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    icon: const Icon(Icons.link),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              )

              //=> Text(e.avatar_url ?? "Repositorio sem nome")),
              // RepositoriesCard(
              //   userName: widget.userName,
              //   controladorAvatar: _controladorAvatar,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
