import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('homepage'),
        ),
        body: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children: [
              myBox(1),
              myBox(1),
              myBox(1),
              myBox(1),
            ]));
  }
}

Widget myBox(int index) {
  return Container(
    margin: EdgeInsets.all(8),
    color: Colors.purple,
    alignment: Alignment.center,
    child: Text("placeholder"),
  );
}
