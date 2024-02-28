// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:trilhaapp/models/postmodel.dart';
import 'package:trilhaapp/models/usermodel.dart';
import 'package:trilhaapp/pages/postpage.dart';

import '../models-viwes/postfull.dart';
import '../repositories/dio/posts.dio.repository.dart';
import '../repositories/posts.repository.dart';

class PostesPage extends StatefulWidget {
  const PostesPage({super.key});

  @override
  State<PostesPage> createState() => _PostesPageState();
}

class _PostesPageState extends State<PostesPage> {
  PostsRepository repository = PostsDioRepository();
  var posts = <PostModel>[];
  var postsTes = <PostModelViews>[];
  bool loading = false;
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    posts = await repository.getPost();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: posts.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PostePage(post: posts[index]),
                            )),
                        child: CarCustonPost(
                          post: posts[index],
                          user: UserModel(
                              username: 'Test_123', name: 'Test Mark 1'),
                        ),
                      );
                    },
                    itemCount: posts.length),
              ));
  }
}

// ignore: must_be_immutable
class CarCustonPost extends StatelessWidget {
  PostModel post;
  UserModel user;

  CarCustonPost({
    super.key,
    required this.post,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.url.toString()),
                radius: 40,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    '@${user.username}',
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    post.body.toString(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
