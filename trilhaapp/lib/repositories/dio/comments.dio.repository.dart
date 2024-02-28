import '../../models/comments.dart';
import '../comments_repository.dart';
import '../jsonplaceholder.custon.dio.dart';

class CommentsDioRepository implements CommentsRepository {
  @override
  Future<List<CommentsModel>> getComments(String id) async {
    var dio = CustonDioV1();
    var response = await dio.dio.get('/posts/$id/comments');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => CommentsModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
