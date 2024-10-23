import 'package:flutter/material.dart';
import 'package:mini_project/models/tips.dart';
import 'package:mini_project/services/post_service.dart';

class PostProviders extends ChangeNotifier {
  List<Post> posts = [];

  Future<void> getPost() async {
    posts = await DioClient().getPosts();
  }

  void createPost(Post post) async {
    Post newPost = await DioClient().createPost(post: post);
    posts.insert(0, newPost);
    notifyListeners();
  }

  void deletePost(int postId) async {
    await DioClient().deletePost(postId: postId);
    posts.removeWhere((post) => post.id == postId);
    notifyListeners();
  }
}
