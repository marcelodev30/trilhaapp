import 'package:trilhaapp/models/postmodel.dart';

import '../jsonplaceholder.custon.dio.dart';
import '../posts.repository.dart';

class PostsDioRepository implements PostsRepository {
  @override
  Future<List<PostModel>> getPost() async {
    //var dio = CustonDio();
    var response = await CustonDioV1().dio.get("/posts");
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
