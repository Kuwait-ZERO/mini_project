import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_project/providers/auth_providers.dart'; // Ensure you have this provider
import 'package:provider/provider.dart'; // Import the provider package

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD1E6F2), // Very Light Blue background
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white), // White text color
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5B9BD5), // Soft Blue AppBar background
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Account details page or perform other action
                Navigator.pushNamed(context, '/profile');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor:
                    const Color(0xFF5B9BD5), // Soft Blue button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Account',
                style: TextStyle(
                    fontSize: 18, color: Colors.white), // White text color
              ),
            ),
            const SizedBox(height: 20), // Spacing between buttons
            Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: const Color(
                              0xFFF2F2F2), // Light background for dialog
                          title: const Text(
                            'Logout',
                            style: TextStyle(
                                color: Colors.black), // Black text color
                          ),
                          content: const Text(
                            'Are you sure you want to log out?',
                            style: TextStyle(
                                color: Colors.black), // Black text color
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel',
                                  style: TextStyle(color: Colors.black)),
                            ),
                            TextButton(
                              onPressed: () {
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .logout();
                                context.go('/');
                              },
                              child: const Text('Logout',
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(
                        0xFFEB5757), // Soft Red for the Logout button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                        fontSize: 18, color: Colors.white), // White text color
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
