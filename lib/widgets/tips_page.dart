import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_project/models/tips.dart';
import 'package:mini_project/providers/post_providers.dart';
import 'package:provider/provider.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Text(pet.name),
                  Text("author: ${post.author}"),
                  Text("Tip: ${post.text}"),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            Provider.of<PostProviders>(context, listen: false)
                                .deletePost(post.id!);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
