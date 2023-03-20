import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visualizador_repositorios_git/services/apiservice.dart';

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
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        "assets/images/6073873.png"), //  NetworkImage('https://via.placeholder.com/150'),
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
              RepositoriesCard(
                userName: widget.userName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RepositoriesCard extends StatelessWidget {
  RepositoriesCard({super.key, required this.userName});
  final String userName;
  ApiService service = ApiService();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(children: [
          FutureBuilder(
              future: service.getRepositories(userName),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var repositories = snapshot.data;

                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: repositories!.length,
                    itemBuilder: (context, index) {
                      var repository = repositories[index];
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
                          //leading: FlutterLogo(),
                          //trailing: Icon(Icons.more_horiz),
                          title: Text(
                            repository!.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            children: [
                              Text(
                                repository.description.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  launchUrl(Uri.parse(repository.html_url));
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
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ]),
      ),
    );
  }
}
