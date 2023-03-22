import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visualizador_repositorios_git/model/repositoriesmodel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

const String urlBase = "https://api.github.com/users/";
const String urlFinal = "/repos";
const String urlAvatar = "https://github.com/";
const String titleText = "\nGitHub";
const String noDescription = "Sem descrição";
const String linkText = "Abrir repo";
const String userNotFound =
    "Usuário não encontrado!\nPor favor, insira um usuário existente.";

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
  List<Repositories> repositoriesTest = [];
  var carregando = true;
  var naoExiste = true;

  loadRepositories() async {
    try {
      final resposta = await Dio().get("$urlBase${widget.userName}$urlFinal");
      if (resposta.data != null) {
        setState(
          () {
            naoExiste = false;
            carregando = false;
            repositoriesTest = List<Repositories>.from(resposta.data.map(
                (repositorioJson) => Repositories.fromJson(repositorioJson)));
          },
        );
      }
    } on DioError catch (err) {
      debugPrint(err.toString());
      setState(() {
        carregando = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadRepositories();
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
        body: carregando
            ? Center(
                child: LoadingAnimationWidget.newtonCradle(
                    color: Colors.cyan, size: 100),
              )
            : naoExiste
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          userNotFound,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        LoadingAnimationWidget.newtonCradle(
                            color: Colors.cyan, size: 100),
                      ],
                    ),
                  )
                : SafeArea(
                    //Se adapta a diferentes tamanhos de tela
                    child: Column(
                      children: <Widget>[
                        const Text(
                          titleText,
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
                                  "$urlAvatar${widget.userName}.png"), // AssetImage("assets/images/6073873.png"),
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
                                          e.name ?? "",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.25,
                                          ),
                                        ),
                                        subtitle: Column(
                                          children: [
                                            Text(
                                              e.description ?? noDescription,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                height: 1.25,
                                              ),
                                            ),
                                            ElevatedButton.icon(
                                              onPressed: () {
                                                launchUrl(Uri.parse(
                                                    e.html_url ?? ""));
                                              },
                                              label: const Text(
                                                linkText,
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
                      ],
                    ),
                  ),
      ),
    );
  }
}
