import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:mini_project/models/user.dart';
import 'package:mini_project/services/Client.dart';
import 'package:mini_project/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

export "package:provider/provider.dart";

class AuthProvider extends ChangeNotifier {
  String token = "";
  late User user;

  void signup({
    required String username,
    required String password,
    required String image,
  }) async {
    token = await AuthServices().signup(
      username: username,
      password: password,
      image: image,
    );
    _setToken(token);
    print(token);
    notifyListeners();
  }

  Future<bool> signin({required User user}) async {
    try {
      token = await AuthServices().signin(user: user);
      this.user = User.fromJson(Jwt.parseJwt(token));
      _setToken(token);
      //print(token);
      print("Image path: ${user.image}");

      notifyListeners();
      return true;
    } on Exception {
      return false;
    }
  }

  void _setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  Future<void> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? "";
    notifyListeners();
  }

  bool isAuth() {
    if (token.isNotEmpty && Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
      user = User.fromJson(Jwt.parseJwt(token));
      Client.dio.options.headers = {
        HttpHeaders.authorizationHeader: "bearer $token"
      };

      return true;
    }

    return false;
  }

  Future<void> initializeAuth() async {
    await _getToken();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    token = "";
    notifyListeners();
  }
}
