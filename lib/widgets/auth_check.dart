import 'package:delivery_app_fominhas/screens/home_screen.dart';
import 'package:delivery_app_fominhas/screens/welcome_screen.dart';
import 'package:delivery_app_fominhas/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return const WelcomeScreen();
    } else {
      return const HomeScreen();
    }
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
