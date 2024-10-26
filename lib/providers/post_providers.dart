import 'package:flutter/material.dart';
import 'package:mini_project/models/tips.dart';
import 'package:mini_project/services/post_service.dart';

class PostProviders extends ChangeNotifier {
  List<Post> posts = [];

  Future<void> getPost() async {
    try {
      posts = await DioClient().getPosts();
      notifyListeners();
    } catch (error) {
      print("Error geting: $error");
    }
  }

  Future<void> createPost(String text) async {
    try {
      Post newPost = await DioClient().createPost(text);
      posts.insert(0, newPost);
      notifyListeners();
    } catch (error) {
      print("Error creating: $error");
    }
  }

  Future<void> deletePost(int postId) async {
    try {
      await DioClient().deletePost(postId: postId);
      posts.removeWhere((post) => post.id == postId);
      notifyListeners();
    } catch (error) {
      print("Error deleting: $error");
    }
  }

  Future<void> upvotePost(int postId, int userId) async {
    try {
      final post = posts.firstWhere((post) => post.id == postId);
      post.upvote(userId); // This should modify the post model's upvote data
      await DioClient().updatePost(post);
      notifyListeners();
    } catch (error) {
      print("Error upvoting: $error");
    }
  }

  Future<void> downvotePost(int postId, String username) async {
    try {
      final post = posts.firstWhere((post) => post.id == postId);
      post.downvote(username); // Pass username as expected by backend
      await DioClient().updatePost(post);
      notifyListeners();
    } catch (error) {
      print("Error downvote: $error");
    }
  }
}
