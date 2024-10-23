class Post {
  int? id;
  String? text;
  String? author;
  // int? upvotes[];
  // int? downvotes[];

  Post({
    this.id,
    this.text,
    this.author,
  });

  Post.fromJson(dynamic json)
      : text = json["text"],
        author = json["author"],
        id = json["id"];
  //  text = json["text"],
  // author = json["author"],

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "text": text,
      "author": author,
    };
  }

  // factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  // Map<String, dynamic> toJson() => _$UserToJson(this);
}
