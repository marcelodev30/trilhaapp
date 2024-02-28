class PostModel {
  int userId = 0;
  int id = 0;
  String title = '';
  String body = '';

  PostModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}
