import 'package:dio/dio.dart';
import 'package:mini_project/models/user.dart';
import 'package:mini_project/services/Client.dart';

class AuthServices {
  final _baseUrl = 'https://coded-pets-api-auth.eapi.joincoded.com';

  Future<String> signup({required User user}) async {
    late String token;
    try {
      Response response = await Client.dio.post('/signup', data: user.toJson());

      token = response.data["token"];
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }

  Future<String> signin({required User user}) async {
    try {
      Response response = await Client.dio.post('/signin', data: user.toJson());

      return response.data["token"];
    } on DioError catch (error) {
      print(error);
    }
    throw "an eroror occored";
  }
}
