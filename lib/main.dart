import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_project/pages/home_page.dart';
import 'package:mini_project/pages/sign_in.dart';
import 'package:mini_project/pages/sign_up.dart';
import 'package:mini_project/providers/auth_providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      // GoRoute(
      //   path: '/add',
      //   builder: (context, state) => AddPage(),
      // ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => SignupPage(),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => SigninPage(),
      ),
      // GoRoute(
      //   path: '/update/:petId',
      //   builder: (context, state) {
      //     final pet = Provider.of<postProvider>(context).pets.firstWhere(
      //         (pet) => pet.id.toString() == (state.pathParameters['petId']!));
      //     return UpdatePage(pet: pet);
      //   },
      // ),
    ],
  );
}
