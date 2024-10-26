import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_project/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<AuthProvider>().initializeAuth();

      if (!mounted) return;

      if (context.read<AuthProvider>().isAuth()) {
        context.go("/home");
      } else {
        context.go("/signin");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return const Placeholder();
=======
    return Scaffold(
      appBar: AppBar(
        title: Text("Medetation App"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Image.asset(
          'assets/images/yoga.webp ',
          fit: BoxFit.cover,
        ),
      ),
    );
>>>>>>> Stashed changes
  }
}
