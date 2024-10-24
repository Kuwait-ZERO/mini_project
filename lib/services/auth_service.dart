import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mini_project/models/user.dart';
import 'package:mini_project/services/Client.dart';

class AuthServices {
  Future<String> signup({
    required String username,
    required String password,
    required String imagePath,
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
              "image": await MultipartFile.fromFile(imagePath),
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
}
