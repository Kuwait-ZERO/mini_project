class User {
  int? id;
  String username;
  String? password;
  String? image; // Added field for image path
  int finishedExercises; // Added field for finished exercises

  User({
    this.id,
    required this.username,
    this.password,
    this.image,
    this.finishedExercises = 0,
  });

  User.fromJson(dynamic json)
      : username = json["username"],
        password = json["password"],
        id = json["id"],
        image = json["image"], // Ensure to parse imagePath
        finishedExercises = json["finishedExercises"] ?? 0;

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
      "id": id,
      "image": image,
      "finishedExercises": finishedExercises,
    };
  }
}

class Meditation {
  final int id;
  final String title;
  final String file;

  Meditation({required this.id, required this.title, required this.file});

  factory Meditation.fromJson(Map<String, dynamic> json) {
    return Meditation(
      id: json['id'],
      title: json['title'],
      file: json['file'],
    );
  }
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
