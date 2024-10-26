import 'dart:async';
import 'package:dio/dio.dart';
import 'package:mini_project/models/tips.dart';
import 'package:mini_project/services/Client.dart';

class DioClient {
  Future<List<Post>> getPosts() async {
    List<Post> posts = [];
    try {
      Response response = await Client.dio.get('/tips');
      posts =
          (response.data as List).map((post) => Post.fromJson(post)).toList();
    } on DioError catch (error) {
      print("Error fetching posts: ${error.message}");
    }
    return posts;
  }

  Future<Post> createPost(String text) async {
    try {
      Response response = await Client.dio.post(
        '/tips',
        data: {"text": text},
      );
      return Post.fromJson(response.data);
    } on DioError catch (error) {
      print("Error creating post: ${error.response}");
    }
    throw Exception("Failed to create post");
  }

  Future<void> deletePost({required int postId}) async {
    try {
      await Client.dio.delete('/tips/$postId');
    } on DioError catch (error) {
      print("Error deleting post: ${error.message}");
    }
  }

  Future<void> updatePost(Post post) async {
    try {
      await Client.dio.patch(
        '/tips/${post.id}',
        data: {
          "upvotes": post.upvotes, // Send user IDs for upvotes
          "downvotes": post.downvotes, // Send author names for downvotes
        },
      );
    } on DioError catch (error) {
      print("Error updating post: ${error.response?.data ?? error.message}");
    }
  }
}
