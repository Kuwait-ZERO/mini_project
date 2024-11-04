import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_project/models/tips.dart';
import 'package:mini_project/providers/auth_providers.dart';
import 'package:mini_project/providers/post_providers.dart';
import 'package:provider/provider.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({Key? key}) : super(key: key);

  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  bool _showMyPostsOnly = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tips"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              context.go('/'); // Navigate to the home screen
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: context.read<AuthProvider>().initializeAuth(),
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (dataSnapshot.error != null) {
            return const Center(child: Text('An error occurred'));
          }

          return Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              if (!authProvider.isAuth()) {
                return Center(
                  child: Text(
                    "Please sign in to view tips.",
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: _showMyPostsOnly,
                            onChanged: (value) {
                              setState(() {
                                _showMyPostsOnly = value ?? false;
                              });
                            },
                          ),
                          const Text("Show only my posts"),
                        ],
                      ),
                    ),
                    FutureBuilder(
                      future: Provider.of<PostProviders>(context, listen: false)
                          .getPost(),
                      builder: (context, dataSnapshot) {
                        if (dataSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (dataSnapshot.error != null) {
                          return const Center(
                            child: Text('An error occurred'),
                          );
                        }

                        return Consumer<PostProviders>(
                          builder: (context, postProvider, child) {
                            final posts = _showMyPostsOnly
                                ? postProvider.posts
                                    .where((post) =>
                                        post.author ==
                                        authProvider.user?.username)
                                    .toList()
                                : postProvider.posts;

                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: posts.length,
                              itemBuilder: (context, index) => PostCard(
                                post: posts[index],
                                showDeleteButton: _showMyPostsOnly,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context)
              .push('/addtip'); // Navigate to the add tip screen
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add), // Icon for the FAB
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final Post post;
  final bool showDeleteButton; // Added flag to control delete button visibility
  const PostCard({Key? key, required this.post, required this.showDeleteButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final isPostOwner = post.author ==
        authProvider
            .user?.username; // Check if the current user is the post author

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Author: ${post.author}"),
            Text("Tip: ${post.text}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        final userId = authProvider.user?.id;
                        if (userId != null) {
                          Provider.of<PostProviders>(context, listen: false)
                              .upvotePost(post.id!, userId);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please log in to vote"),
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.thumb_up,
                        color: Colors.green,
                      ),
                    ),
                    Text(post.upvotes.length.toString()),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        final userId = authProvider.user?.id;
                        if (userId != null) {
                          Provider.of<PostProviders>(context, listen: false)
                              .downvotePost(post.id!, userId.toString());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please log in to vote"),
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.thumb_down,
                        color: Colors.red,
                      ),
                    ),
                    Text(post.downvotes.length.toString()),
                  ],
                ),
                if (showDeleteButton &&
                    isPostOwner) 
                  IconButton(
                    onPressed: () {
                      Provider.of<PostProviders>(context, listen: false)
                          .deletePost(post.id!);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddTipForm extends StatefulWidget {
  @override
  AddTipFormState createState() {
    return AddTipFormState();
  }
}

class AddTipFormState extends State<AddTipForm> {
  final _formKey = GlobalKey<FormState>();
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a Tip"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Share Your Tip:",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Write your tip!',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blueAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blueAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                ),
                maxLines: null,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please fill out this field";
                  }
                  return null;
                },
                onSaved: (value) {
                  text = value!;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Provider.of<PostProviders>(context, listen: false)
                          .createPost(text);
                      await Future.delayed(const Duration(seconds: 1));
                      GoRouter.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor:
                        Colors.blueAccent, 
                  ),
                  child: const Text(
                    "Add Tip Post!",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
