import 'package:flutter/material.dart';

import 'tela.dart';

void main() {
  runApp(GitRepo());
}

class GitRepo extends StatelessWidget {
  const GitRepo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
      home: const Tela(),
    );
  }
}
