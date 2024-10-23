import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_project/pages/home_page.dart';
import 'package:mini_project/pages/meditation_page.dart';
import 'package:mini_project/pages/music_page.dart';
import 'package:mini_project/pages/sign_in.dart';
import 'package:mini_project/pages/sign_up.dart';
import 'package:mini_project/pages/tips_page.dart';
import 'package:mini_project/pages/yoga_page.dart';
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
      GoRoute(
        path: '/Yoga',
        builder: (context, state) => YogaPage(),
      ),
      GoRoute(
        path: '/Music',
        builder: (context, state) => MusicPage(),
      ),
      GoRoute(
        path: '/Meditation',
        builder: (context, state) => MeditationPage(),
      ),
      GoRoute(
        path: '/Tips',
        builder: (context, state) => TipsPage(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => SignupPage(),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => SigninPage(),
      ),
    ],
  );
}
