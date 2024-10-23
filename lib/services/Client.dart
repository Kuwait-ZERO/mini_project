import 'package:dio/dio.dart';

class Client {
  static final Dio dio = Dio(
      BaseOptions(baseUrl: 'https://coded-pets-api-auth.eapi.joincoded.com'));
}
