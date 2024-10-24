import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_project/models/user.dart';
import 'package:mini_project/providers/auth_providers.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  XFile? _image;
  String name = "";
  String gender = "";
  int age = 0;
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
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).signup(
                    username: usernameController.text,
                    password: passwordController.text,
                    imagePath: _image!.path);
                context.pop();
              },
              child: const Text("Sign Up"),
            )
          ],
        ),
      ),
    );
  }
}
