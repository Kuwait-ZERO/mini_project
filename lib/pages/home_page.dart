import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:mini_project/providers/auth_providers.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3D9A5), // Light Green background
      appBar: AppBar(
        title: const Text(
          'Good Morning, User!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF6BBF59), // Soft Green AppBar
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon:
                const Icon(Icons.menu, color: Colors.white), // White menu icon
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor:
            const Color(0xFFF5F5DC), // Light Beige drawer background
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF6BBF59), // Soft Green header background
              ),
              child: const Text(
                'Welcome, User!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title:
                  const Text('Profile', style: TextStyle(color: Colors.black)),
              onTap: () {
                context.go('/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title:
                  const Text('Settings', style: TextStyle(color: Colors.black)),
              onTap: () {
                context.go('/settings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              title:
                  const Text('Logout', style: TextStyle(color: Colors.black)),
              onTap: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
                context.go('/signin');
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color:
                  const Color(0xFFF5F5DC), // Light Beige container background
              borderRadius: BorderRadius.circular(20),
            ),
            margin:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            height: 350,
            child: const Icon(
              Icons.nature_people, // Big icon
              size: 150, // Big icon size to fill the container
              color: Color(0xFF6BBF59), // Soft Green icon color
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              padding: const EdgeInsets.all(16),
              children: [
                InkWell(
                  onTap: () {
                    context.go("/meditation");
                  },
                  child: Card(
                    color:
                        const Color(0xFFF5F5DC), // Light Beige card background
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.spa,
                          size: 60,
                          color: Colors.black, // Black icon for contrast
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Meditation',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Black text color
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.go("/music");
                  },
                  child: Card(
                    color:
                        const Color(0xFFF5F5DC), // Light Beige card background
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.music_note,
                          size: 60,
                          color: Colors.black, // Black icon for contrast
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Music',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Black text color
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.go("/tips");
                  },
                  child: Card(
                    color:
                        const Color(0xFFF5F5DC), // Light Beige card background
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.lightbulb_outline,
                          size: 60,
                          color: Colors.black, // Black icon for contrast
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Tips',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Black text color
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.go("/yoga");
                  },
                  child: Card(
                    color:
                        const Color(0xFFF5F5DC), // Light Beige card background
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.self_improvement,
                          size: 60,
                          color: Colors.black, // Black icon for contrast
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Yoga',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Black text color
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
