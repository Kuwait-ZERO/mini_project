class Post {
  int? id;
  String? text;
  String? author;
  List<int> upvotes;
  List<String> downvotes;

  Post({
    this.id,
    this.text,
    this.author,
    List<int>? upvotes,
    List<String>? downvotes,
  })  : upvotes = upvotes ?? [],
        downvotes = downvotes ?? [];

  Post.fromJson(dynamic json)
      : id = json["id"],
        text = json["text"],
        author = json["author"],
        upvotes = List<int>.from(json["upvotes"] ?? []),
        downvotes = List<String>.from(json["downvotes"] ?? []);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "text": text,
      "author": author,
      "upvotes": upvotes,
      "downvotes": downvotes,
    };
  }

  void upvote(int userId) {
    if (!upvotes.contains(userId)) {
      upvotes.add(userId);
      downvotes.remove(userId.toString());
    }
  }

  void downvote(String userId) {
    if (!downvotes.contains(userId)) {
      downvotes.add(userId);
      upvotes.remove(int.tryParse(userId));
    }
  }
}
