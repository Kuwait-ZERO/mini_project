// import 'package:adopt_app/services/pets.dart';
// import 'package:adopt_app/models/pet.dart';
// import 'package:flutter/material.dart';

// class PostProviders extends ChangeNotifier {
//   List<Post> posts = [];

//   Future<void> getPost() async {
//     posts = await DioClient().getPets();
//   }

//   void createPost(Post post) async {
//     Post newPost = await DioClient().createPost(post: post);
//     posts.insert(0, newPost);
//     notifyListeners();
//   }

//   void updatePost(Post post) async {
//     Post newPost = await DioClient().updatePost(post: post);
//     int index = posts.indexWhere((post) => post.id == newPost.id);
//     posts[index] = newPost;
//     notifyListeners();
//   }


//   void deletePost(int petId) async {
//     await DioClient().deletePost(postId: postId);
//     posts.removeWhere((post) => post.id == postId);
//     notifyListeners();
//   }
// }