import 'dart:convert';

import 'package:trilhaapp/models/postmodel.dart';
import 'package:http/http.dart' as http;
import 'package:trilhaapp/models/usermodel.dart';

import '../posts.repository.dart';

class PostHttpRepository implements PostsRepository {
  @override
  Future<List<PostModel>> getPost() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => PostModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<List<UserModel>> getUsers() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<UserModel> getUserById(String id) async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/$id'));
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      return UserModel();
    }
  }
}
