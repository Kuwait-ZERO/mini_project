import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_project/providers/music_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MusicListPage extends StatefulWidget {
  @override
  _MusicListPageState createState() => _MusicListPageState();
}

class _MusicListPageState extends State<MusicListPage> {
  bool _showFavoritesOnly = false; // State to toggle favorite tracks

  @override
  void initState() {
    super.initState();
    Provider.of<MusicProvider>(context, listen: false).fetchMusic();
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Tracks'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 128, 88, 197),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              context.go('/');
            },
          ),
        ],
      ),
      body: Consumer<MusicProvider>(
        builder: (context, musicProvider, child) {
          if (musicProvider.musicList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final musicListToDisplay = _showFavoritesOnly
              ? musicProvider.musicList
                  .where(
                      (music) => musicProvider.isFavorite(music.id.toString()))
                  .toList()
              : musicProvider.musicList;

          return Column(
            children: [
              CheckboxListTile(
                title: const Text(
                  'Show Favorites Only',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                value: _showFavoritesOnly,
                onChanged: (value) {
                  setState(() {
                    _showFavoritesOnly = value ?? false;
                  });
                },
                activeColor: Colors.deepPurple,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: musicListToDisplay.length,
                  itemBuilder: (context, index) {
                    final music = musicListToDisplay[index];
                    final isFavorite =
                        musicProvider.isFavorite(music.id.toString());

                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      elevation: 6,
                      color: Colors.white,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.music_note,
                            color: Colors.deepPurple),
                        title: Text(
                          music.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          "Tap to play",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.grey,
                              ),
                              onPressed: () {
                                musicProvider
                                    .toggleFavorite(music.id.toString());
                              },
                            ),
                            const Icon(Icons.play_arrow,
                                color: Colors.deepPurple),
                          ],
                        ),
                        onTap: () {
                          String url;

                          if (music.title == 'Track 1') {
                            url =
                                'http://coded-meditation.eapi.joincoded.com/media/music/track_1.mp4';
                          } else if (music.title == 'Track 2') {
                            url =
                                'http://coded-meditation.eapi.joincoded.com/media/music/track_2.mp4';
                          } else if (music.title == 'Track 3') {
                            url =
                                'http://coded-meditation.eapi.joincoded.com/media/music/track_3.mp4';
                          } else if (music.title == 'Track 4') {
                            url =
                                'http://coded-meditation.eapi.joincoded.com/media/music/track_4.mp4';
                          } else if (music.title == 'Track 5') {
                            url =
                                'http://coded-meditation.eapi.joincoded.com/media/music/track_5.mp4';
                          } else if (music.title == 'Track 6') {
                            url =
                                'http://coded-meditation.eapi.joincoded.com/media/music/track_6.mp4';
                          } else {
                            url = '';
                          }

                          if (url.isNotEmpty) {
                            _launchURL(url);
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
