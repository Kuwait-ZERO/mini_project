import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_project/providers/auth_providers.dart';
import 'package:mini_project/models/user.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3D9A5), // Light Green background
      appBar: AppBar(
<<<<<<< Updated upstream
        title: const Text(
          "Sign in",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF6BBF59), // Soft Green AppBar
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                    'assets/images/your_image.png'), // Placeholder image
                backgroundColor: Colors.transparent,
=======
        title: const Text("Sign in"),
        backgroundColor: const Color(0xFF005BAA),
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
                  backgroundColor: Colors.transparent,
                ),
>>>>>>> Stashed changes
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Burgan Bank',
              style: TextStyle(
                color: Colors.black, // Black text for contrast
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
                fillColor:
                    const Color(0xFFF5F5DC), // Light Beige background for input
                hintText: "Username / Email",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.account_circle, color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFF6BBF59), // Soft Green border when focused
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
                fillColor:
                    const Color(0xFFF5F5DC), // Light Beige background for input
                hintText: "Password",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.lock_outline, color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFF6BBF59), // Soft Green border when focused
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFF6BBF59), // Soft Green button color
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
                style: TextStyle(color: Color(0xFF6BBF59)), // Soft Green text
              ),
            ),
          ],
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
