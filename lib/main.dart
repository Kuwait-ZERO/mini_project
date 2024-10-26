import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_project/pages/home_page.dart';
import 'package:mini_project/pages/meditation_page.dart';
import 'package:mini_project/pages/music_page.dart';
import 'package:mini_project/pages/profile_page.dart';
import 'package:mini_project/pages/sign_in.dart';
import 'package:mini_project/pages/sign_up.dart';
import 'package:mini_project/pages/setting_page.dart';
import 'package:mini_project/pages/splash_page.dart';
import 'package:mini_project/pages/tips_page.dart';
import 'package:mini_project/pages/yoga_page.dart';
import 'package:mini_project/providers/auth_providers.dart';
import 'package:mini_project/providers/exercise_provider.dart';
import 'package:mini_project/providers/metitation_provider.dart';
import 'package:mini_project/providers/music_provider.dart';
import 'package:mini_project/providers/post_providers.dart';
import 'package:provider/provider.dart';

void main() async {
  var authProvider = AuthProvider();

  await authProvider.initializeAuth();
  authProvider.isAuth();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PostProviders>(create: (_) => PostProviders()),
        ChangeNotifierProvider<AuthProvider>(create: (_) => authProvider),
        ChangeNotifierProvider<ExerciseProvider>(
            create: (_) => ExerciseProvider()),
        ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider<MeditationProvider>(
            create: (_) => MeditationProvider()),
        ChangeNotifierProvider<MusicProvider>(create: (_) => MusicProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class ThemeNotifier with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp.router(
          routerConfig: _router,
          debugShowCheckedModeBanner: false,
          theme: themeNotifier.isDarkMode ? darkTheme() : lightTheme(),
        );
      },
    );
  }

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => SigninPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/yoga',
        builder: (context, state) => YogaPage(),
      ),
      GoRoute(
        path: '/music',
        builder: (context, state) => MusicListPage(),
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
        builder: (context, state) => MeditationListPage(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => SettingsPage(),
      ),
      GoRoute(
        path: '/addtip',
        builder: (context, state) => AddTipForm(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => ProfilePage(),
      ),
    ],
  );

  ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.deepPurple,
    );
  }
}
