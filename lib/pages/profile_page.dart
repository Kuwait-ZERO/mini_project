import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_project/main.dart';
import 'package:mini_project/models/user.dart';
import 'package:mini_project/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;
    final themeNotifier =
        Provider.of<ThemeNotifier>(context); // Access ThemeNotifier

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton.icon(
              onPressed: () {
                context.go('/'); // Navigate to the home screen
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: const Text(
                "Home",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Image
            CircleAvatar(
              radius: 70,
              backgroundImage: user?.image != null
                  ? (kIsWeb || Uri.parse(user!.image!).isAbsolute
                      ? NetworkImage(user.image!)
                      : FileImage(File(user.image!)) as ImageProvider)
                  : null,
              child: user?.image == null
                  ? const Icon(
                      Icons.account_circle,
                      size: 100,
                      color: Colors.grey,
                    )
                  : null,
            ),
            const SizedBox(height: 40),
            // Username Display with Label
            Text(
              user?.username != null
                  ? "Username: ${user!.username}"
                  : "Username not available",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Finished Exercises Count (non-editable)
            Text(
              "Finished Exercises: ${user?.finishedExercises ?? 0}",
              style: const TextStyle(fontSize: 20, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Dark Mode Toggle Switch
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: themeNotifier.isDarkMode,
              onChanged: (value) {
                themeNotifier.toggleTheme();
              },
            ),
          ],
        ),
      ),
    );
  }
}



  // Future<void> _updateProfile() async {
  //   final authProvider = Provider.of<AuthProvider>(context, listen: false);
  //   final updatedUser = authProvider.user;

  //   if (updatedUser != null) {
  //     updatedUser.username = _usernameController.text;

  //     try {
  //       await authProvider.updateUserProfile(updatedUser);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Profile updated successfully')),
  //       );
  //     } catch (e) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Failed to update profile: $e')),
  //       );
  //     }
  //   }
  // }


     // ElevatedButton(
            //   onPressed: () {}, // _updateProfile,
            //   child: const Text('Save Changes'),
            // ),

                  // Optional: Add Edit Button
            // ElevatedButton(
            //   onPressed: () {
            //     // Navigate to edit profile page or open edit dialog
            //   },
            //   child: const Text('Edit Profile'),
            // ),