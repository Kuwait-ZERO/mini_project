import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_project/pages/home_page.dart';
import 'package:mini_project/pages/meditation_page.dart';
import 'package:mini_project/pages/music_page.dart';
<<<<<<< HEAD
import 'package:mini_project/pages/sign_in.dart';
import 'package:mini_project/pages/sign_up.dart';
=======
import 'package:mini_project/pages/setting_page.dart';
import 'package:mini_project/pages/sign_in.dart';
import 'package:mini_project/pages/sign_up.dart';
import 'package:mini_project/pages/splash_page.dart';
>>>>>>> f3575bef434723f1145e6245e153491aa2b93c72
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

enum RouteNames {
  home,
  yoga,
  splash,
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
    //  initialLocation: "/splash",
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SigninPage(),
      ),
<<<<<<< HEAD
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
=======
      // GoRoute(
      //   path: '/splash',
      //   builder: (context, state) => SplashPage(),
      // ),
>>>>>>> f3575bef434723f1145e6245e153491aa2b93c72
      GoRoute(
        path: '/home',
        name: RouteNames.home.name, //home
        builder: (context, state) => HomePage(),
        routes: [
          GoRoute(
            path: 'yoga',
            name: "yoga",
            builder: (context, state) => YogaPage(),
          ),
          GoRoute(
            path: 'music',
            builder: (context, state) => MusicPage(),
          ),
        ],
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => SignupPage(),
      ),
      GoRoute(
        path: '/tips',
        builder: (context, state) => TipsPage(),
      ),
      GoRoute(
        path: '/meditation',
        builder: (context, state) => MeditationPage(),
      ),
      //  GoRoute(
      //   path: '/profile',
      //   builder: (context, state) => profilePage(),
      // ),
      GoRoute(
        path: '/setting',
        builder: (context, state) => SettingsPage(),
      ),
    ],
  );
}
