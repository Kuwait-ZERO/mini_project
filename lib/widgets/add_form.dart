import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_project/models/tips.dart';
import 'package:mini_project/providers/post_providers.dart';
import 'package:provider/provider.dart';

class AddTipForm extends StatefulWidget {
  @override
  AddTipFormState createState() {
    return AddTipFormState();
  }
}

class AddTipFormState extends State<AddTipForm> {
  final _formKey = GlobalKey<FormState>();

  String text = "";
  String author = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3D9A5), // Light Green background
      appBar: AppBar(
        title: const Text(
          "Add Tip",
          style: TextStyle(color: Colors.white), // White text color
        ),
        backgroundColor: const Color(0xFF6BBF59), // Soft Green app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(
                      0xFFF5F5DC), // Light Beige background for input
                  hintText: 'Author Name',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please fill out this field";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  author = value!;
                },
                style: const TextStyle(color: Colors.black), // Black text
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(
                      0xFFF5F5DC), // Light Beige background for input
                  hintText: 'Write your tip!',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                maxLines: null,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please fill out this field";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  text = value!;
                },
                style: const TextStyle(color: Colors.black), // Black text
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF6BBF59), // Soft Green button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      Provider.of<PostProviders>(context, listen: false)
                          .createPost(
                        Post(author: author, text: text),
                      );
                      GoRouter.of(context).pop();
                    }
                  },
                  child: const Text(
                    "Add Tip Post!",
                    style:
                        TextStyle(color: Colors.white), // White text on button
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
