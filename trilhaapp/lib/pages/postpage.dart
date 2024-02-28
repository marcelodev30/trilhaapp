import 'package:flutter/material.dart';
import 'package:trilhaapp/models/comments.dart';
import '../models/postmodel.dart';
import '../repositories/comments_repository.dart';
import '../repositories/dio/comments.dio.repository.dart';

// ignore: must_be_immutable
class PostePage extends StatefulWidget {
  PostModel post;
  PostePage({super.key, required this.post});

  @override
  State<PostePage> createState() => _PostePageState();
}

class _PostePageState extends State<PostePage> {
  CommentsRepository repositoryComments = CommentsDioRepository();
  var comments = <CommentsModel>[];
  @override
  void initState() {
    super.initState();
    carregaDados();
  }

  carregaDados() async {
    comments = await repositoryComments.getComments(widget.post.id.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comments')),
      body: comments.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (_, index) {
                        return Dismissible(
                          key: Key(comments[index].name.toString()),
                          background: Container(
                            color: Colors.red,
                            child: const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.delete_outline,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                    radius: 30,
                                    child: Text(
                                        comments[index].name.toString()[0])),
                                title: Text(comments[index].body.toString()),
                                trailing: const Icon(Icons.favorite),
                              ),
                              const Divider(
                                color: Colors.black,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    height: 100,
                    child: Row(
                      children: [
                        const Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Add a comment..',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.send)),
                        )),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Post',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ))
                      ],
                    ),
                  )
                ],
              )),
    );
  }
}
