class PostModelViews {
  String? name;
  String? username;
  String? body;
  String? url = 'https://picsum.photos/200/200';

  PostModelViews({this.name, this.username, this.body});

  PostModelViews.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    body = json['post'];
  }
}
