import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:mini_project/models/exercise.dart';

class ExerciseProvider extends ChangeNotifier {
  List<ExerciseVideo> videos = [];
  final Dio _dio = Dio();

  Future<void> fetchExercises() async {
    try {
      final response = await _dio
          .get('https://coded-meditation.eapi.joincoded.com/exercises');
      videos = (response.data as List)
          .map((videoJson) => ExerciseVideo.fromJson(videoJson))
          .toList();
      notifyListeners();
    } catch (error) {
      print("Error ExerciseProvider: $error");
    }
  }
}
