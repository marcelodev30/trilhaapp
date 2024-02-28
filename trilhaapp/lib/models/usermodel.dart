class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  String? url = 'https://picsum.photos/200/200';

  UserModel({this.id, this.name, this.username, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
  }
}
