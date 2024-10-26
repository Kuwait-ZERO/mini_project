import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
=======
import 'package:mini_project/pages/video_page.dart';
import 'package:mini_project/providers/exercise_provider.dart';
import 'package:provider/provider.dart';

class YogaPage extends StatefulWidget {
  @override
  _YogaPageState createState() => _YogaPageState();
}

class _YogaPageState extends State<YogaPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<ExerciseProvider>(context, listen: false).fetchExercises();
  }
>>>>>>> Stashed changes

class YogaPage extends StatelessWidget {
  YogaPage({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Sign Up"),
            TextField(
              decoration: const InputDecoration(hintText: 'Username'),
              controller: usernameController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Password'),
              controller: passwordController,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Sign Up"),
            )
          ],
        ),
      ),
    );
  }
}
