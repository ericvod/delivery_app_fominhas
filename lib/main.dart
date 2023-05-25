import 'package:delivery_app_01/screens/home_screen.dart';
import 'package:delivery_app_01/screens/login_screen.dart';
import 'package:delivery_app_01/screens/user_register.dart';
import 'package:delivery_app_01/screens/registration_option.dart';
import 'package:delivery_app_01/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.blueAccent),
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => const WelcomeScreen(),
      "/login": (context) => const LoginScreen(),
      "/home": (context) => const HomeScreen(),
      "/user_register": (context) => const UserRegister(),
      "/registrationOption": (context) => const RegistrationOption(),
    },
  ));
}
