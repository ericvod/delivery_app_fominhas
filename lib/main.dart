import 'package:delivery_app_fominhas/screens/home_screen.dart';
import 'package:delivery_app_fominhas/screens/login_screen.dart';
import 'package:delivery_app_fominhas/screens/user_register.dart';
import 'package:delivery_app_fominhas/screens/registration_option.dart';
import 'package:delivery_app_fominhas/screens/welcome_screen.dart';
import 'package:delivery_app_fominhas/services/auth_service.dart';
import 'package:delivery_app_fominhas/widgets/auth_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blueAccent),
      debugShowCheckedModeBanner: false,
      home: const AuthCheck(),
      routes: {
        "/welcome_screen": (context) => const WelcomeScreen(),
        "/login": (context) => const LoginScreen(),
        "/home": (context) => const HomeScreen(),
        "/user_register": (context) => const UserRegister(),
        "/registrationOption": (context) => const RegistrationOption(),
      },
    );
  }
}
