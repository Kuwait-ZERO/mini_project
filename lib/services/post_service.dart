import 'dart:async';

import "package:dio/dio.dart";
import 'package:mini_project/models/tips.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'https://coded-meditation.eapi.joincoded.com';

  Future<List<Post>> getPosts() async {
    List<Post> posts = [];
    try {
      Response response = await _dio.get(_baseUrl + '/tips');
      posts =
          (response.data as List).map((post) => Post.fromJson(post)).toList();
    } on DioError catch (error) {
      print(error);
    }
    return posts;
  }

  Future<Post> createPost({required Post post}) async {
    late Post retrievedPost;
    try {
      FormData data = FormData.fromMap({
        "text": post.text,
        "author": post.author,
      });
      Response response = await _dio.post(_baseUrl + '/tips', data: data);
      retrievedPost = Post.fromJson(response.data);
    } on DioError catch (error) {
      print(error);
    }
    return retrievedPost;
  }

  Future<void> deletePost({required int postId}) async {
    try {
      await _dio.delete(_baseUrl + '/tips${postId}');
    } on DioError catch (error) {
      print(error);
    }
  }
}
