// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class ApiService {
//   Future<void> get() async {
//     Response response;
//     Dio dio = new Dio();
//     try {
//       response = await dio.get("https://api.github.com/users/anabellon/repos");
//       //var listRepositories = (response.data as List)

//       debugPrint("Foi? ${response.data}");
//     } on DioError catch (err) {
//       debugPrint("Deu erro kkkcry ${err.response!.statusCode}");
//     }
//   }
// }
