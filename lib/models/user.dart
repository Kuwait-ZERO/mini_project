import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

class User {
  int? id;
  String username;
  String? password;

  User({this.id, required this.username, this.password});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(username: json['username'], password: json['password']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": id,
        "username": username,
        "password": password,
      };
}
