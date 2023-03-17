import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:visualizador_repositorios_git/model/repositoriesmodel.dart';

class ApiService {
  Future<void> get() async {
    Response response;
    Dio dio = Dio();
    try {
      response = await dio.get("https://api.github.com/users/anabellon/repos");

      debugPrint(
          "Foi? ${response.data[0]['id']}"); //pegando o id do objeto 0 do vetor
    } on DioError catch (err) {
      debugPrint("Deu erro kkkcry ${err.response!.statusCode}");
    }
  }
}
