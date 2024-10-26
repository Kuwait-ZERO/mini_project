class ExerciseVideo {
  final int id;
  final String title;
  final String file;
  final bool finished;

  ExerciseVideo({
    required this.id,
    required this.title,
    required this.file,
    required this.finished,
  });

  factory ExerciseVideo.fromJson(Map<String, dynamic> json) {
    return ExerciseVideo(
      id: json['id'],
      title: json['title'],
      file: json['file'],
      finished: json['finished'],
    );
  }
}
