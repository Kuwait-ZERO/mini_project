// import 'dart:io';

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
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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

            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    Provider.of<PostProviders>(context, listen: false)
                        .createPost(text);
                    GoRouter.of(context).pop();
                  }
                },
                child: const Text("Add Tip post!"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
