// part 'user.g.dart';

import 'dart:core';

class User {
  int? id;
  String username;
  String? password;

  User({
    this.id,
    required this.username,
    this.password,
  });

  User.fromJson(dynamic json)
      : username = json["username"],
        password = json["password"],
        id = json["id"];

  Map<String, dynamic> toJson() {
    return {"username": username, "password": password, "id": id};
  }

  // factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  // Map<String, dynamic> toJson() => _$UserToJson(this);
}

// void parsingExample() {
//   Map json1 = {"username": "ghanim", "password": "123", "id": 1};
//   Map json2 = {"username": "ghanim", "password": "123", "id": 1};
//   Map json3 = {"username": "ghanim", "password": "123", "id": 1};

//   var json = [
//     {"username": "ghanim", "password": "123", "id": 1},
//     {"username": "ghanim", "password": "123", "id": 2},
//     {"username": "ghanim", "password": "123", "id": 3},
//   ];

  //  print(json["id"]);

  // User user = User.a(json);

  // List<User> users = [];

  // for (int i = 0; json.length < i; i++) {
  //   var u = User.fromJson(json[i]);
  //   users.add(u);
  // }

  // var users2 = json.map((j) => User.fromJson2(j)).toList();

// }
  // User({this.id, required this.username, this.password});

  // factory User.fromJson(Map<String, dynamic> json) =>
  //     User(username: json['username'], password: json['password']);

  // Map<String, dynamic> toJson() => <String, dynamic>{
  //       "id": id,
  //       "username": username,
  //       "password": password,
  //     };
// }
