import 'dart:convert';
import 'package:flutter_docs/Model/user_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

Future<UserModel> fetchData(int count) async {
  Response response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$count'));
  Map<String, dynamic> decodedJson = json.decode(response.body);
  return UserModel.fromJson(decodedJson);
}
