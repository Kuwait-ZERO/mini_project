import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_project/providers/auth_providers.dart'; // Ensure you have this provider
import 'package:provider/provider.dart'; // Import the provider package

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Account Button
            ElevatedButton(
              onPressed: () {
                // Navigate to Account details page or perform other action
                Navigator.pushNamed(context, '/profile');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue, // Customize the color
              ),
              child: Text(
                'Account',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20), // Spacing between buttons
            // Logout Button
            Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return ElevatedButton(
                  onPressed: () {
                    // Perform logout action
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Logout'),
                          content: Text('Are you sure you want to log out?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .logout();
                                context.go('/');
                              },
                              child: Text('Logout'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor:
                        Colors.red, // Customize the color for Logout
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(fontSize: 18),
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
