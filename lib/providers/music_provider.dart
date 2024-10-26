import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MusicTrack {
  final int id;
  final String title;
  final String file;

  MusicTrack({required this.id, required this.title, required this.file});
}

class MusicProvider with ChangeNotifier {
  List<MusicTrack> musicList = [];
  Set<String> favoriteTracks = {};

  MusicProvider() {
    loadFavorites();
  }

  Future<void> fetchMusic() async {
    final response = await http
        .get(Uri.parse('https://coded-meditation.eapi.joincoded.com/music'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      musicList = data
          .map((track) => MusicTrack(
              id: track['id'], title: track['title'], file: track['file']))
          .toList();
      notifyListeners();
      print('Fetched music tracks: ${musicList.length}');
    } else {
      throw Exception('Failed to load music');
    }
  }

  Future<void> toggleFavorite(String trackId) async {
    if (favoriteTracks.contains(trackId)) {
      favoriteTracks.remove(trackId); // Remove from favorites
    } else {
      favoriteTracks.add(trackId); // Add to favorites
    }
    await saveFavorites(); // Save updated favorites to storage
    notifyListeners();
  }

  bool isFavorite(String trackId) {
    return favoriteTracks.contains(trackId);
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favoriteTracks', favoriteTracks.toList());
    print(favoriteTracks);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? storedFavorites = prefs.getStringList('favoriteTracks');
    if (storedFavorites != null) {
      favoriteTracks = storedFavorites.toSet();
    }
  }
}
