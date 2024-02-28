import 'package:trilhaapp/models/postmodel.dart';

abstract class PostsRepository {
  Future<List<PostModel>> getPost();
}
