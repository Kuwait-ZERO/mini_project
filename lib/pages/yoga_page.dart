<<<<<<< HEAD
import 'package:flutter/material.dart';

class YogaPage {
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YogaPage extends StatelessWidget {
  YogaPage({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
>>>>>>> f3575bef434723f1145e6245e153491aa2b93c72
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: const Text("update a Pet"),
=======
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
>>>>>>> f3575bef434723f1145e6245e153491aa2b93c72
      ),
    );
  }
}
