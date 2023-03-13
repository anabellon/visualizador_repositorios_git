import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'repositoriomodel.dart';
import 'repositoriopage.dart';

class ApiService {
  static const baseUrl = 'api.github.com';

  static Future<dynamic> getRepositories() async {
    var url = Uri.https(baseUrl, '/repositories');
    var response = await http.get(url).then;

    /*
    Em construção
      var repositories = (json.decode(response.body))
        .map((item) => Repositorio.fromJson(item))
        .toList();

    return repositories;
  */
  }
}
