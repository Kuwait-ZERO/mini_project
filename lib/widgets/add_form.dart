// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:mini_project/models/tips.dart';
import 'package:mini_project/providers/post_providers.dart';
import 'package:provider/provider.dart';

class AddPetForm extends StatefulWidget {
  @override
  AddPetFormState createState() {
    return AddPetFormState();
  }
}

class AddPetFormState extends State<AddPetForm> {
  final _formKey = GlobalKey<FormState>();

  String text = "";
  String author = "";
  int id = 0;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Author Name',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "please fill out this field";
              } else {
                return null;
              }
            },
            onSaved: (value) {
              author = value!;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Write your tip!',
            ),
            maxLines: null,
            validator: (value) {
              if (value!.isEmpty) {
                return "please fill out this field";
              } else {
                return null;
              }
            },
            onSaved: (value) {
              text = value!;
            },
          ),
          // this might be uneeded because id should be assigned to user once account is made.
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Pet age',
            ),
            validator: (value) {
              if (value == null) {
                return "please enter an age";
              } else if (int.tryParse(value) == null) {
                return "please enter a number";
              }
              return null;
            },
            onSaved: (value) {
              id = int.parse(value!);
            },
          ),

          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print(id);
                  Provider.of<PostProviders>(context, listen: false)
                      .createPost(Post(author: author, text: text, id: id));
                  GoRouter.of(context).pop();
                }
              },
              child: const Text("Add Tip post!"),
            ),
          )
        ],
      ),
    );
  }
}
