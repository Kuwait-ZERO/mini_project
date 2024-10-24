import 'dart:async';

import "package:dio/dio.dart";
import 'package:mini_project/models/tips.dart';
import 'package:mini_project/services/Client.dart';

class DioClient {
  Future<List<Post>> getPosts() async {
    List<Post> posts = [];
    try {
      Response response = await Client.dio.get('/tips');
      posts =
          (response.data as List).map((post) => Post.fromJson(post)).toList();
    } on DioException catch (error) {
      print(error.message);
    }
    return posts;
  }

  Future<Post> createPost(String text) async {
    Map data = ({
      "text": text,
    });
    try {
      Response response = await Client.dio.post(
        '/tips',
        data: {
          "text": text,
        },
      );

      return Post.fromJson(response.data);
    } on DioException catch (error) {
      print(error.response);
    }
    throw "failed";
  }

  Future<void> deletePost({required int postId}) async {
    try {
      await Client.dio.delete('/tips${postId}');
    } on DioException catch (error) {
      print(error.message);
    }
  }
}
