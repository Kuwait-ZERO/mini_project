import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mini_project/providers/auth_providers.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final user = authProvider.user;

    return Scaffold(
      backgroundColor: const Color(0xFFA3D9A5), // Light Green background
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white), // White text
        ),
        backgroundColor:
            const Color(0xFF6BBF59), // Soft Green AppBar background
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.transparent,
              // backgroundImage: user.imagePath != null
              //     ? FileImage(File(user.imagePath!))
              //     : const AssetImage('assets/images/default_profile.png') as ImageProvider, // Placeholder image
            ),
            const SizedBox(height: 20),
            Text(
              user.username,
              style: const TextStyle(
                color: Colors.black, // Black text for username
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            _buildProfileField("Username", user.username),
            const SizedBox(height: 20),
            // _buildProfileField("Password", user.password, obscureText: true), // Obscured password field
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String value,
      {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black, // Black label color
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          readOnly: true,
          obscureText: obscureText,
          style: const TextStyle(color: Colors.black), // Black text
          decoration: InputDecoration(
            filled: true,
            fillColor:
                const Color(0xFFF5F5DC), // Light Beige background for input
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          controller: TextEditingController(text: value),
        ),
      ],
    );
  }
}
