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
  List<MusicTrack> musicList = []; // List of music tracks
  Set<String> favoriteTracks = {}; // Store favorite track IDs

  MusicProvider() {
    loadFavorites(); // Load favorites from storage on initialization
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
      notifyListeners(); // Notify listeners to rebuild the UI
      print('Fetched music tracks: ${musicList.length}'); // Debug print
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
    notifyListeners(); // Notify listeners to update UI
  }

  bool isFavorite(String trackId) {
    return favoriteTracks.contains(trackId);
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favoriteTracks', favoriteTracks.toList());
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? storedFavorites = prefs.getStringList('favoriteTracks');
    if (storedFavorites != null) {
      favoriteTracks = storedFavorites.toSet();
    }
  }
}
