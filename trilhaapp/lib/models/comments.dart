class CommentsModel {
  int postId = 0;
  int id = 0;
  String name = '';
  String email = '';
  String body = '';

  CommentsModel(
      {required this.postId,
      required this.id,
      required this.name,
      required this.email,
      required this.body});

  CommentsModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
}
