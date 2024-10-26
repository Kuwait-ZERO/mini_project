import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_project/main.dart';
import 'package:mini_project/providers/metitation_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MeditationListPage extends StatefulWidget {
  @override
  _MeditationListPageState createState() => _MeditationListPageState();
}

class _MeditationListPageState extends State<MeditationListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<MeditationProvider>(context, listen: false).fetchMeditations();
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
        title: const Text('Meditation Sessions'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: Consumer<MeditationProvider>(
        builder: (context, meditationProvider, child) {
          if (meditationProvider.meditations.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: meditationProvider.meditations.length,
            itemBuilder: (context, index) {
              final meditation = meditationProvider.meditations[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 4,
                child: ListTile(
                  leading: const Icon(Icons.spa, size: 40, color: Colors.blue),
                  title: Text(
                    meditation.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.play_arrow, color: Colors.blue),
                  onTap: () {
                    switch (meditation.title) {
                      case 'Alone':
                        _launchURL(
                            'http://coded-meditation.eapi.joincoded.com/media/meditation/alone.mp3');
                        break;
                      case 'Breath':
                        _launchURL(
                            'http://coded-meditation.eapi.joincoded.com/media/meditation/breath.mp3');
                        break;
                      case 'Driving':
                        _launchURL(
                            'http://coded-meditation.eapi.joincoded.com/media/meditation/driving.mp3');
                        break;
                      case 'Overwhelmed':
                        _launchURL(
                            'http://coded-meditation.eapi.joincoded.com/media/meditation/overwhelmed.mp3');
                        break;
                      case 'Panicking':
                        _launchURL(
                            'http://coded-meditation.eapi.joincoded.com/media/meditation/panicking.mp3');
                        break;
                      case 'Anxious':
                        _launchURL(
                            'http://coded-meditation.eapi.joincoded.com/media/meditation/anxious.mp3');
                        break;
                      default:
                        print('Meditation not found');
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
