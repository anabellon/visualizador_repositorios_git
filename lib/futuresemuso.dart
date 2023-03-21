import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/apiservice.dart';

class RepositoriesCard extends StatefulWidget {
  RepositoriesCard(
      {super.key, required this.userName, required this.controladorAvatar});

  final String userName;
  final TextEditingController controladorAvatar;

  @override
  State<RepositoriesCard> createState() => _RepositoriesCardState();
}

class _RepositoriesCardState extends State<RepositoriesCard> {
  ApiService service = ApiService();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(children: [
          FutureBuilder(
              future: service.getRepositories(widget.userName),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var repositories = snapshot.data;

                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: repositories!.length,
                    itemBuilder: (context, index) {
                      var repository = repositories[index];
                      widget.controladorAvatar.text = repository.avatar_url;
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
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            children: [
                              Text(
                                repository.description.toString(),
                                style: const TextStyle(
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
