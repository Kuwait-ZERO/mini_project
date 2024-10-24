import 'package:dio/dio.dart';
import 'package:mini_project/models/user.dart';
import 'package:mini_project/services/Client.dart';

class AuthServices {
  final Dio _dio = Dio();

  final _baseUrl = 'https://coded-meditation.eapi.joincoded.com';

  Future<String> signup({
    required String username,
    required String password,
    required String imagePath,
  }) async {
    late String token;
    try {
      Response response = await _dio.post(_baseUrl + '/signup',
          data: FormData.fromMap({
            "username": username,
            "password": password,
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
