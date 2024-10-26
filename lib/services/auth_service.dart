import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mini_project/models/user.dart';
import 'package:mini_project/services/Client.dart';

class AuthServices {
  Future<String> signup({
    required String username,
    required String password,
    required String image,
  }) async {
    late String token;
    try {
      Response response = await Client.dio.post('/signup',
          data: FormData.fromMap({
            "username": username,
            "password": password,
            if (kIsWeb)
              "image": "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
            else
              "image": await MultipartFile.fromFile(image),
          }));
      token = response.data["token"];
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }

  Future<String> signin({required User user}) async {
    late String token;
    try {
      Response response = await Client.dio.post('/signin', data: user.toJson());
      token = response.data["token"];
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }

  Future<void> updateUserProfile(User user) async {
    final data = {
      'username': user.username,
      if (user.image != null) 'image': user.image,
    };

    try {
      final response = await Client.dio.put('/user/${user.id}', data: data);
      print("Profile update response: ${response.data}");
    } on DioError catch (error) {
      print("Error updating profile: ${error.response?.data ?? error.message}");
    }
  }
}
