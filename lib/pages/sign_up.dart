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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3D9A5), // Light Green background
      appBar: AppBar(
        title: const Text(
          "Sign up",
          style: TextStyle(color: Colors.white), // White text
        ),
        backgroundColor:
            const Color(0xFF6BBF59), // Soft Green AppBar background
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
<<<<<<< Updated upstream
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              // backgroundImage: _image != null
              //     ? FileImage(File(_image!.path))
              //     : const AssetImage('assets/images/default_profile.png') as ImageProvider, // Placeholder image
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    const Color(0xFFF5F5DC), // Light Beige background for input
=======
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              GestureDetector(
                onTap: () async {
                  XFile? pickedImage =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _image = pickedImage;
                  });
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[300],
                  backgroundImage:
                      _image != null ? NetworkImage(_image!.path) : null,
                  child: _image == null
                      ? const Icon(
                          Icons.add_a_photo,
                          size: 40,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              // Username Field
              _buildTextField(
                controller: usernameController,
>>>>>>> Stashed changes
                hintText: 'Username',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              controller: usernameController,
              style: const TextStyle(color: Colors.black), // Black text
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    const Color(0xFFF5F5DC), // Light Beige background for input
                hintText: 'Password',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              controller: passwordController,
              obscureText: true,
              style: const TextStyle(color: Colors.black), // Black text
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFF6BBF59), // Soft Green button color
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).signup(
                  username: usernameController.text,
                  password: passwordController.text,
                  imagePath: _image != null ? _image!.path : "",
                );
                context.pop();
              },
              child:
                  const Text("Sign Up", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
