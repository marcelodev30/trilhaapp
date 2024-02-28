import '../models/comments.dart';

abstract class CommentsRepository {
  Future<List<CommentsModel>> getComments(String id);
}
