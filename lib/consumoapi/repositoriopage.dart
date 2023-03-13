import 'package:flutter/material.dart';
import 'package:visualizador_repositorios_git/consumoapi/apiservice.dart';

class RepositorioPage extends StatefulWidget {
  const RepositorioPage({super.key});

  @override
  State<RepositorioPage> createState() {
    return _RepositorioPageState();
  }
}

class _RepositorioPageState extends State<RepositorioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return FutureBuilder(
      future: ApiService.getRepositories(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ListView();
      },
    );
  }
}
