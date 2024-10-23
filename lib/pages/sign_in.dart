import 'package:flutter/material.dart';
import 'package:mini_project/models/user.dart';
import 'package:mini_project/providers/auth_providers.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Color usernameBorderColor = const Color(0xFF005BAA);
  Color passwordBorderColor = const Color(0xFF005BAA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5F1F9),
      appBar: AppBar(
        title: const Text("Sign in"),
        backgroundColor: const Color(0xFF005BAA), // Burgan Bank Blue
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/burgan.jpg'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to Burgan Bank',
                style: TextStyle(
                  color: Color(0xFF005BAA),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: usernameController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Username / Email",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.account_circle, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: usernameBorderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFF005BAA),
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Password",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: passwordBorderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFF005BAA),
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF005BAA),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  var result =
                      await Provider.of<AuthProvider>(context, listen: false)
                          .signin(
                    user: User(
                      username: usernameController.text,
                      password: passwordController.text,
                    ),
                  );

                  if (result) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("You are Signed in")),
                    );
                    context.go('/home');
                  } else {
                    showError(context, "Email and/or Password is wrong");
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  context.go('/signup');
                },
                child: const Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(color: Color(0xFF005BAA)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(message),
      ),
    );
  }
}
