import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_project/providers/auth_providers.dart';
import 'package:mini_project/providers/post_providers.dart';
import 'package:mini_project/widgets/tips_page.dart';
import 'package:provider/provider.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3D9A5), // Light Green background
      appBar: AppBar(
        title: const Text(
          "Tips",
          style: TextStyle(color: Colors.white), // White text color
        ),
        backgroundColor:
            const Color(0xFF6BBF59), // Soft Green AppBar background
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor:
            const Color(0xFFF5F5DC), // Light Beige drawer background
        child: FutureBuilder(
          future: context.read<AuthProvider>().initializeAuth(),
          builder: (context, dataSnapshot) => Consumer<AuthProvider>(
            builder: (context, authProvider, child) => authProvider.isAuth()
                ? ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        child: Text(
                          "Welcome ${authProvider.user.username}",
                          style: const TextStyle(
                              color: Colors.white), // White text
                        ),
                        decoration: const BoxDecoration(
                          color:
                              Color(0xFF6BBF59), // Soft Green header background
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          "Logout",
                          style: TextStyle(color: Colors.black), // Black text
                        ),
                        trailing: const Icon(Icons.logout,
                            color: Colors.black), // Black icon
                        onTap: () {
                          Provider.of<AuthProvider>(context, listen: false)
                              .logout();
                        },
                      ),
                    ],
                  )
                : ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const DrawerHeader(
                        child: Text(
                          "Sign in please",
                          style: TextStyle(color: Colors.white), // White text
                        ),
                        decoration: BoxDecoration(
                          color:
                              Color(0xFF6BBF59), // Soft Green header background
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          "Signin",
                          style: TextStyle(color: Colors.black), // Black text
                        ),
                        trailing: const Icon(Icons.login,
                            color: Colors.black), // Black icon
                        onTap: () {
                          GoRouter.of(context).push('/signin');
                        },
                      ),
                      ListTile(
                        title: const Text(
                          "Signup",
                          style: TextStyle(color: Colors.black), // Black text
                        ),
                        trailing: const Icon(Icons.how_to_reg,
                            color: Colors.black), // Black icon
                        onTap: () {
                          GoRouter.of(context).push('/signup');
                        },
                      )
                    ],
                  ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FutureBuilder(
              future:
                  Provider.of<PostProviders>(context, listen: false).getPost(),
              builder: (context, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (dataSnapshot.error != null) {
                    return const Center(
                      child: Text(
                        'An error occurred',
                        style: TextStyle(
                            color: Colors.black), // Black text for errors
                      ),
                    );
                  } else {
                    return Consumer<PostProviders>(
                      builder: (context, postProvider, child) =>
                          GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 2.5,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: postProvider.posts.length,
                        itemBuilder: (context, index) =>
                            PostCard(post: postProvider.posts[index]),
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6BBF59), // Soft Green button color
        onPressed: () {
          GoRouter.of(context).push('/addtip');
        },
        child: const Icon(Icons.add,
            color: Colors.white), // White icon on green button
      ),
    );
  }
}
