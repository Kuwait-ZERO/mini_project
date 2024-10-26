import 'package:flutter/material.dart';
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
              return ListTile(
                title: Text(meditation.title),
                onTap: () {
                  if (meditation.title == 'Alone') {
                    _launchURL(
                        'http://coded-meditation.eapi.joincoded.com/media/meditation/alone.mp3');
                  } else if (meditation.title == 'Breath') {
                    _launchURL(
                        'http://coded-meditation.eapi.joincoded.com/media/meditation/breath.mp3');
                  } else if (meditation.title == 'Driving') {
                    _launchURL(
                        'http://coded-meditation.eapi.joincoded.com/media/meditation/driving.mp3');
                  } else if (meditation.title == 'Overwhelmed') {
                    _launchURL(
                        'http://coded-meditation.eapi.joincoded.com/media/meditation/overwhelmed.mp3');
                  } else if (meditation.title == 'Panicking') {
                    _launchURL(
                        'http://coded-meditation.eapi.joincoded.com/media/meditation/panicking.mp3');
                  } else if (meditation.title == 'Anxious') {
                    _launchURL(
                        'http://coded-meditation.eapi.joincoded.com/media/meditation/anxious.mp3');
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
