import 'package:flutter/material.dart';

import 'myapp.dart';

void main() {
  runApp(const GitRepo());
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
      home: const MyApp(),
    );
  }
}
