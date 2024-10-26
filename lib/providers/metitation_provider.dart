import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/models/user.dart';

class MeditationProvider with ChangeNotifier {
  List<Meditation> _meditations = [];

  List<Meditation> get meditations => _meditations;

  Future<void> fetchMeditations() async {
    try {
      final response = await Dio()
          .get('https://coded-meditation.eapi.joincoded.com/meditation');
      if (response.statusCode == 200) {
        _meditations = (response.data as List)
            .map((item) => Meditation.fromJson(item))
            .toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load meditations');
      }
    } catch (e) {
      print(e);
    }
  }
}
