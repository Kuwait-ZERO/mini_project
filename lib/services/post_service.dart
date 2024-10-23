// import 'dart:async';
// import 'package:adopt_app/models/pet.dart';
// import "package:dio/dio.dart";

// class DioClient {
//   final Dio _dio = Dio();

//   final _baseUrl = 'https://coded-pets-api-auth.eapi.joincoded.com';

//   Future<List<Post>> getPets() async {
//     List<Post> posts [];
//     try {
//       Response response = await _dio.get(_baseUrl + '/posts');
//       posts = (response.data as List).map((pet) => Post.fromJson(post)).toList();
//     } on DioError catch (error) {
//       print(error);
//     }
//     return posts;
//   }

//   Future<Post> createPet({required Post pet}) async {
//     late Post retrievedPet;
//     try {
//       FormData data = FormData.fromMap({
//         "name": post.name,
//         "age": post.age,
//         "gender": post.gender,
        
//       });
//       Response response = await _dio.post(_baseUrl + '/posts', data: data);
//       retrievedPost = Post.fromJson(response.data);
//     } on DioError catch (error) {
//       print(error);
//     }
//     return retrievedPet;
//   }

//   Future<Post> updatePet({required Post pet}) async {
//     late Post retrievedPost;
//     try {
//       FormData data = FormData.fromMap({
//         "name": pet.name,
//         "age": pet.age,
//         "gender": pet.gender,
        
//       });

//       Response response =
//           await _dio.put(_baseUrl + '/posts/${pet.id}', data: data);
//       retrievedPet = Post.fromJson(response.data);
//     } on DioError catch (error) {
//       print(error);
//     }
//     return retrievedPet;
//   }

//   Future<void> deletePet({required int petId}) async {
//     try {
//       await _dio.delete(_baseUrl + '/posts/${petId}');
//     } on DioError catch (error) {
//       print(error);
//     }
//   }


// }
