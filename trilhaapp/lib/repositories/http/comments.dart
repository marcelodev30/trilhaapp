import 'dart:convert';

import 'package:trilhaapp/models/comments.dart';
import 'package:http/http.dart' as http;

import '../comments_repository.dart';

class CommentsHttpRepositories implements CommentsRepository {
  @override
  Future<List<CommentsModel>> getComments(String id) async {
    var response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/$id/comments'));

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => CommentsModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
