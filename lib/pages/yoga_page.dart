import 'package:flutter/material.dart';
import 'package:mini_project/pages/video_page.dart';
import 'package:mini_project/providers/exercise_provider.dart';
import 'package:provider/provider.dart';

// Main Yoga Page with Exercise List
class YogaPage extends StatefulWidget {
  @override
  _YogaPageState createState() => _YogaPageState();
}

class _YogaPageState extends State<YogaPage> {
  @override
  void initState() {
    super.initState();
    // Fetch exercises when the page is initialized
    Provider.of<ExerciseProvider>(context, listen: false).fetchExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yoga Exercises'),
      ),
      body: Consumer<ExerciseProvider>(
        builder: (context, exerciseProvider, child) {
          if (exerciseProvider.videos.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: exerciseProvider.videos.length,
            itemBuilder: (context, index) {
              final video = exerciseProvider.videos[index];
              return ListTile(
                title: Text(video.title),
                onTap: () {
                  // Play the video
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerPage(video: video),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
