import 'package:flutter/material.dart';
import 'package:mini_project/models/user.dart';
import 'package:mini_project/pages/home_page.dart';
import 'package:mini_project/providers/auth_providers.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Sign In"),
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
              onPressed: () async {
                var result =
                    await Provider.of<AuthProvider>(context, listen: false)
                        .signin(
                            user: User(
                                username: usernameController.text,
                                password: passwordController.text));

                if (result) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("You are Signin")));
                  context.push('/setting');
                }
              },
              child: const Text("Sign In"),
            )
          ],
        ),
      ),
    );
  }
}
