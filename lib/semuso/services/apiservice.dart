// ApiService - Future sem uso


// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:visualizador_repositorios_git/model/repositoriesmodel.dart';

// class ApiService {
//   static const baseUrl = "https://api.github.com/users/";

//   // ignore: body_might_complete_normally_nullable
//   Future<List<dynamic>?> getRepositories(String username) async {
//     var url = "$baseUrl$username/repos";
//     Response response;
//     Dio dio = Dio();
//     try {
//       response = await dio.get(url);

//       var repositories =
//           (response.data).map((item) => Repositories.fromJson(item)).toList();

//       //debugPrint(repositories.toString());

//       return repositories;

//       // debugPrint(
//       //     "Foi? ${response.data[0]['id']}"); //pegando o id do objeto 0 do vetor
//     } on DioError catch (err) {
//       debugPrint("Deu erro kkkcry ${err.response!.statusCode}");
//     }
//   }
// }
